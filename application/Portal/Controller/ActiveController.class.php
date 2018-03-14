<?php
namespace Portal\Controller;
/**
 * 首页
 */
class ActiveController extends WechatController {
	
	public function index() {
		header("Content-type: text/html; charset=utf-8");
		if(!$this->is_weixin()){
			$phtml = "<title>抱歉，出错了</title><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=0\"><link rel=\"stylesheet\" type=\"text/css\" href=\"https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\">";
			$phtml .= "<div class=\"page_msg\"><div class=\"inner\"><span class=\"msg_icon_wrp\"><i class=\"icon80_smile\"></i></span><div class=\"msg_content\"><h4>请在微信客户端打开链接</h4></div></div></div>";
			echo $phtml;
			exit;
		}else{
			$hdid = I('hdid');
			$publicid = I('publicid');
			$weObj = $this->init($publicid);
			$signPackage = $weObj->getJsSign();
			$this->assign ("signPackage",$signPackage);
			$this->getOpneid($publicid);
			$openid = cookie('openid');
			if (!empty($openid)) {
				$hdres = M('active')->where(array('id'=>$hdid))->find();
				$nowdatetime = date('Y-m-d H:i:s');   
		 		$start_time = $hdres['start_time']; 
		 		$end_time = $hdres['end_time']; 
		 		if(strtotime($nowdatetime)<strtotime($start_time)){
		 			$activetime = 1; //活动还没开始
		 		}elseif(strtotime($nowdatetime)>strtotime($end_time)){   
		  			$activetime = 2; //活动已结束   
		 		}else{
		  			$activetime = 3; //活动进行中
		 		} 
		 		// echo $activetime; 		
		 		$res = M('prize')->where(array('hdid'=>$hdid))->field('name,bgcolor')->select();
		 		$jparr1 = [];
		 		$bgcolor = [];
		 		foreach ($res as $k => $v) {
		 			array_push($jparr1, $v['name']);
		 			array_push($bgcolor, $v['bgcolor']);
		 		}
		 		$str = join(",",$jparr1);
		 		$colorstr = join(",",$bgcolor);
				$inStr = "['".str_replace(",","','",$str)."']";
				$bgcolorStr = "['".str_replace(",","','",$colorstr)."']";

				$res_user = M('wxuser')->where(array('openid'=>$openid))->find();
				if($res_user['isguanzhu']!=1){
					$isguanzhu = 0;
					$res_con = M('wxconfig')->where(array('id'=>$publicid))->field('icon')->find();
				}else{
					$isguanzhu = 0;
				}
				/*var_dump($res_con);
				exit();*/

				$this->assign('hdid',$hdid);
				$this->assign('publicid',$publicid);
				$this->assign('activetime',$activetime);
				$this->assign('numtype',$hdres['numtype']);
				$this->assign('hdname',$hdres['name']);
				$this->assign('hdbgimg',$hdres['bgimg']);
				$this->assign('jparr',$inStr);
				$this->assign('bgcolorStr',$bgcolorStr);
				$this->assign('isguanzhu',$isguanzhu);
				$this->assign('pubimg',$res_con['icon']);
				if (!empty($hdid)) {
					$this->display();
				}
			}else{
				$url = 'http://' . $_SERVER ['HTTP_HOST'].U('Portal/Active/index',array('hdid'=>$hdid,'publicid'=>$publicid));
				$this->tzurl($url,$publicid);
			}
		}		
    }

    public function jp() {
    	$cjtotal_table = M('cjtotal');

    	$openid = cookie('openid');
    	$hdid = I('hdid');
    	$nowdate = date('Y-m-d');
    	$map['hdid'] = $hdid;
    	// $map['openid'] = $openid;
        $map['createtime']=array('like',$nowdate.'%');
    	$numtype = I('numtype');
    	// 判断（1代表每天都有规定的次数抽，2表示仅规定的次数抽）
    	if ($numtype==1) {
    		$cjtotal = $cjtotal_table->where($map)->count();
    	}else{
    		// $cjtotal = $cjtotal_table->where(array('hdid'=>$hdid,'openid'=>$openid))->count();  		
    		$cjtotal = $cjtotal_table->where(array('hdid'=>$hdid))->count();  		
    	}
    	if ($cjtotal<3) {
    		$cjres = $this->cjres($hdid,$openid);
    	}else{
    		$cjres = 'fail';
    	}	
		$this->ajaxReturn($cjres);
    }

    // 抽奖数据写入到中奖名单
    public function zjmd(){
    	$openid = cookie('openid');
    	$jpid = I('jpid');

    	$data = array(
    		'name' => I('name'),
    		'jpid' => $jpid,
    		'tel' => I('tel'),
    		'openid' => $openid,
    		'hdid' => I('hdid'),
    		'islj' => 2,
    		'time' => date('Y-m-d H:i:s')
    		);
		// M('prize')->where(array('id'=>$jpid))->setInc('zjnum');
		M('zjmd')->add($data);
		$this->ajaxReturn(true);
    }

    // 抽奖结果
    public function cjres($hdid,$openid){
    	$prize_table = M('prize');

    	$res = $prize_table->where(array('hdid'=>$hdid))->select();
		/*foreach ($res as $k => $v) {    
			$arr[$k+1] = $v['proba'];  
		}*/
		foreach ($res as $k => $v) {    
			$arr[$k][1] = $v['proba'];//概率
			$arr[$k][2] = $v['id'];//老id
			$arr[$k][3] = $k+1;//新id
		}
		$data = array(
			'openid' => $openid,
			'hdid' => $hdid,
			'createtime' => date('Y-m-d H:i:s')
			);
		$zj_res = $this->get_rand($arr);
		// 判断奖品数量
		$jpid = $zj_res[2];
		$map['id'] = $jpid;
		$jp_res = $prize_table->where($map)->find();
		// 若此次抽中的奖品数量已领完则将抽中的奖品改成谢谢参与
		if ($jp_res['jpnum']==$jp_res['zjnum']) {
			$zj_res[3] = 1;
		}
		M('cjtotal')->add($data);
		return $zj_res;
    }

    // 根据中奖概率开始抽奖
    function get_rand($proArr) {    
		$result = '';       
		//概率数组的总概率精度
		$gl = array();//概率
		for ($i=0; $i < count($proArr); $i++) { 
		   	array_push($gl, $proArr[$i][1]);
		}   
		$proSum = array_sum($gl);
		//概率数组循环    
		foreach ($proArr as $key => $proCur) {      
			$randNum = mt_rand(1, $proSum);
		    if ($randNum <= $proCur[1]) {   
		      	$result = $proCur;break;  
		    } else {
		    	$proSum -= $proCur[1]; 
		    }
		}
		unset ($proArr);
		return $result;
	}

    /*function get_rand($proArr) {    
		$result = '';       
		//概率数组的总概率精度    
		$proSum = array_sum($proArr);       
		//概率数组循环    
		foreach ($proArr as $key => $proCur) {
			var_dump($proCur);   
			$randNum = mt_rand(1, $proSum);
		    if ($randNum <= $proCur) {        
		      	$result = $key;break;  
		    } else {
		    	$proSum -= $proCur; 
		    }
		}
		unset ($proArr);
		var_dump($result);
		exit();
		return $result; 
	}*/
}


