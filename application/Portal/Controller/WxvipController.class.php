<?php
namespace Portal\Controller;
/**
 * 首页
 */
class WxvipController extends WechatController {	

	// 创建会员卡
	public function createVip(){
		$vipvardid = I('id');
		$publicid = I('publicid');
		$map['id'] = $vipvardid;
		$map['publicid'] = $publicid;
		$res = M('wxvipcard')->where($map)->find();
		$business_service = explode(',', $res['business_service']);
        $new_bsar = array_merge(array_filter($business_service));

        // 'http://'.$_SERVER['HTTP_HOST'].'/data/upload/'.$res['image_url']
        // $jhurl = 'http://'.$_SERVER['HTTP_HOST'].U('Portal/Wxvip/activate_url');

        /*'wx_activate' => true,
    	'wx_activate_after_submit' => true,
 		'wx_activate_after_submit_url' => $jhurl, 
    	'activate_url ' => $jhurl,*/

        // $jhurl = 'www.baidu.com';
		$jhlink = 'http://'.$_SERVER['HTTP_HOST'].U('Portal/Wxvip/jh',array('accountid'=>$publicid));

        /*$data = array (
    		'card' => array (
    			'card_type' => 'MEMBER_CARD',
    			'member_card' => array (
    				'background_pic_url' => $res['background_pic_url'],
      				'wx_activate' => true,
    				// 'wx_activate_after_submit' => true,
 					// 'wx_activate_after_submit_url' => $jhlink,
      				'base_info' => array (
        				'logo_url' => $res['logo_url'],
        				'brand_name' => $res['brand_name'],
        				'code_type' => 'CODE_TYPE_QRCODE',
        				'title' => $res['title'],
        				'color' => $res['color'],
        				'notice' => '使用时请出示此卡',
        				'service_phone' => $res['service_phone'],
        				'description' => $res['description'],
        				'date_info' => array (
          					'type' => 'DATE_TYPE_PERMANENT'
        					),
        				'sku' => array (
          					'quantity' => $res['quantity']
        					),
        				'get_limit' => $res['get_limit'],
        				'use_custom_code' => false,
        				// 'get_custom_code_mode' => 'GET_CUSTOM_CODE_MODE_DEPOSIT',
        				'can_give_friend' => false,
        				'promotion_url_name' => $res['promotion_url_name'],
        				'promotion_url' => $res['promotion_url'],
        				'need_push_on_view' => false
      					),
      				'advanced_info' => array (
      					'text_image_list' => array (
          					0 => array (
            					'image_url' => 'http://'.$_SERVER['HTTP_HOST'].'/data/upload/'.$res['image_url'],
            					'text' => $res['text']
          					)
        				),
        				'time_limit' => array (
          					0 => array (
            					'type' => 'HOLIDAY'
          					)
        				),
        				'business_service' => $new_bsar
      				),
      			'supply_bonus' => true,
      			'supply_balance' => false,
    			'activate_url ' => $jhlink,
      			'prerogative' => $res['prerogative'],
      			'custom_field1' => array (
        			'name_type' => 'FIELD_NAME_TYPE_LEVEL',
        			'url' => $res['name_type_url']
      			),
      			'bonus_rule' => array (
			        'cost_money_unit' => $res['cost_money_unit']*100,
			        'increase_bonus' => $res['increase_bonus'],
			        'max_increase_bonus' => $res['max_increase_bonus'],
			        'init_increase_bonus' => $res['init_increase_bonus'],
			        'cost_bonus_unit' => $res['cost_bonus_unit'],
			        'reduce_money' => $res['reduce_money']*100,
			        'least_money_to_use_bonus' => $res['least_money_to_use_bonus']*100,
			        'max_reduce_bonus' => $res['max_reduce_bonus']
      			),
      			'discount' => '10'
      			)
    		)
  		);*/
		$logourl = $this->uploadimg($publicid,$res['logo_url']);
		// $bacurl = $this->uploadimg($publicid,$res['background_pic_url']);
		$twurl = $this->uploadimg($publicid,$res['image_url']);
		// var_dump($logourl);exit();
        $data = array (
        	'card' => array (
        		'card_type' => 'MEMBER_CARD',
    			'member_card' => array (
    				'background_pic_url' => $res['background_pic_url'],
      				'base_info' => array (
      					'logo_url' => $logourl,
				        'brand_name' => $res['brand_name'],
				        'code_type' => 'CODE_TYPE_QRCODE',
				        'title' => $res['title'],
				        'color' => $res['color'],
				        'notice' => '使用时请出示此码',
				        'service_phone' => $res['service_phone'],
				        'description' => $res['description'],
        				'date_info' => array (
        					'type' => 'DATE_TYPE_PERMANENT'
        				),
        				'sku' => array (
        					'quantity' => $res['quantity']
        				),
				        'get_limit' => $res['get_limit'],
				        'use_custom_code' => false,
				        'can_give_friend' => false,
				        'promotion_url_name' => $res['promotion_url_name'],
				        'promotion_url' => $res['promotion_url'],
				        'need_push_on_view' => false,
      				),
      				'advanced_info' => array (
        				'text_image_list' => array (
        					0 => array (
        						'image_url' => $twurl,
        						'text' => $res['text'],
          					),
        				),
	        			'time_limit' => array (
	        				0 => array (
	        					'type' => 'HOLIDAY',
	          				),
	        			),
	        			'business_service' => $new_bsar,
      				),
      			'supply_bonus' => true,
			    'supply_balance' => false,
			    'prerogative' => $res['prerogative'],
			    'activate_url' => $jhlink,
			    'bonus_rule' => array (
			        'cost_money_unit' => $res['cost_money_unit']*100,
					'increase_bonus' => $res['increase_bonus'],
					'max_increase_bonus' => $res['max_increase_bonus'],
					'init_increase_bonus' => $res['init_increase_bonus'],
					'cost_bonus_unit' => $res['cost_bonus_unit'],
					'reduce_money' => $res['reduce_money']*100,
					'least_money_to_use_bonus' => $res['least_money_to_use_bonus']*100,
					'max_reduce_bonus' => $res['max_reduce_bonus'],
      			),
      			'discount' => $res['discount'],
    			),
  			),
		);

  		/*$weObj = $this->init(2);
    	$result = $weObj->createCard($data12);
  		echo "OK";
    	exit();*/

  		$weObj = $this->init($publicid);
  		if ($res['isopen'] == 0) {
    		$result = $weObj->createCard($data);
    		if($result['errcode']==0){
    			$data1['cardid'] = $result['card_id'];
    			$data1['isopen'] = 1;
    			M('wxvipcard')->where($map)->save($data1);
    			$this->success("会员卡开卡成功");    			
    		}else{
    			// var_dump($result);exit();
    			$this->error("会员卡开卡失败");
    		}
  		}
	}

	// 会员卡投放（创建二维码）
	public function createQRcode(){
		$wxvipcard_table = M('wxvipcard');
		$wxvipscene_table = M('wxvipscene');
		$id = I('id');
		$outer_str = I('outerid');  //场景来源
		$res = $wxvipcard_table->field('id,publicid,cardid')->where(array('id'=>$id))->find();
		$publicid = $res['publicid'];
		$cardid = $res['cardid'];
		$weObj = $this->init($publicid);
		$data = array (
			'action_name' => 'QR_CARD',
  			'expire_seconds' => '1800',
  			'action_info' => array (
  				'card' => array (
      				'card_id' => $cardid,
      				'is_unique_code' => false,
      				'outer_str' => $outer_str
    			)
  			)
		);
		$res_ticket = $weObj->createCardQrcode1($data);
		if ($res_ticket) {
			$remark = I('remark');
			$res_scene = $wxvipscene_table->where(array('publicid'=>$publicid,'outerid'=>$outer_str))->find();
			if (empty($res_scene)) {
				$data_scene = array('publicid'=>$publicid,'outerid'=>$outer_str,'remark'=>$remark);
				$wxvipscene_table->add($data_scene);
			}
			$this->ajaxReturn($res_ticket);
		}
	}

	// 激活要填的信息
	public function jh(){
		header("Content-type: text/html; charset=utf-8");
		if(!$this->is_weixin()){
			$phtml = "<title>抱歉，出错了</title><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=0\"><link rel=\"stylesheet\" type=\"text/css\" href=\"https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\">";
			$phtml .= "<div class=\"page_msg\"><div class=\"inner\"><span class=\"msg_icon_wrp\"><i class=\"icon80_smile\"></i></span><div class=\"msg_content\"><h4>请在微信客户端打开链接</h4></div></div></div>";
			echo $phtml;
			exit;
		}else{
			$accountid = I('accountid');
			$weObj = $this->init($accountid);
			$signPackage = $weObj->getJsSign();
			$this->assign ("signPackage",$signPackage);
			$this->getOpneid($accountid);
			$openid = cookie('openid');
			if (!empty($openid)) {
				$map['publicid'] = $accountid;
				$map['openid'] = $openid;
				$res = M('vipdetail')->where($map)->field('id,name,tel,cardnumber,isjihuo')->find();
				$this->assign('res',$res);
				$this->display();
			}else{
				$url = 'http://' . $_SERVER ['HTTP_HOST'].U('Portal/Wxvip/jh',array('accountid'=>$accountid));
				$this->tzurl($url,$accountid);
			}	
		}
	}
	// 会员卡激活链接
	public function activateurl(){
		$vipdetail_table = M('vipdetail');
		$wxvipcard_table = M('wxvipcard');

		$id = I('id');
		$name = I('name');
		$tel = I('tel');

		$res_vipdetail = $vipdetail_table->where(array('id'=>$id))->field('publicid,cardcode,cardid')->find();
		$num_3 = $vipdetail_table->where(array('isjihuo'=>1,'cardid'=>$res_vipdetail['cardid']))->count();
		$res_vipcard = $wxvipcard_table->where(array('cardid'=>$res_vipdetail['cardid']))->field('membership_number')->find();

		// 创建会员卡后7位数
		$arr=range(0,9);
		shuffle($arr);
		foreach ($arr as $k => $v) {
			$a .= $v;
		}
		$num = rand(2,9);
		$rand = substr($a,$num-2,3);
		$strlen = strlen($num_3);
		$newnum_3 = $num_3+1;
		switch ($strlen) {
			case '0':
			case '1':$cardno = $rand.'000'.$newnum_3;break;
			case '2':$cardno = $rand.'00'.$newnum_3;break;
			case '3':$cardno = $rand.'0'.$newnum_3;break;
			case '4':$cardno = $rand.$newnum_3;break;
			default:break;
		}
		$cardnum = $res_vipcard['membership_number'].$cardno;
		$jharr = array(
			'membership_number' => $cardnum,
			'code' => $res_vipdetail['cardcode']
		);
		$weObj = $this->init($res_vipdetail['publicid']);
		$isjh = $weObj->activateMemberCard($jharr);
		if ($isjh) {
			$data = array(
				'card_id'=>$res_vipdetail['cardid'],
				'code'=>$res_vipdetail['cardcode']
			);
			$result = $weObj->getVipCardInfo($data);
			if ($result) {
				$newvipdata = array(
					'name' => $name,
					'tel' => $tel,
					'cardnumber' => $cardnum,
					'isjihuo' => 1,
					'bonus' => $result['bonus'],
					'user_card_status' => $result['user_card_status'],
					'jhtime' => date('Y-m-d')
				);
				$vipdetail_table->where(array('id'=>$id))->save($newvipdata);
				$url = 'http://' . $_SERVER ['HTTP_HOST'].U('Portal/Wxvip/jh',array('accountid'=>$res_vipdetail['publicid']));
				$this->redirect($url);
			}
			
		}else{
			echo "激活失败";
		}
	}
	public function inteDestroy(){
		$accountid = I('accountid');
		$weObj = $this->init($accountid);
		$signPackage = $weObj->getJsSign();
		$this->assign ("signPackage",$signPackage);
		$this->getOpneid($accountid);
		$openid = cookie('openid');
		if (!empty($openid)) {
			$res_scan = M('wxuser')->where(array('openid'=>$openid))->field('isscan')->find();
			if ($res_scan['isscan']==1) {
				$this->assign('publicid',$accountid);
				$this->display();
			}else{
				$phtml = "<title>抱歉，出错了</title><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=0\"><link rel=\"stylesheet\" type=\"text/css\" href=\"https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\">";
				$phtml .= "<div class=\"page_msg\"><div class=\"inner\"><span class=\"msg_icon_wrp\"><i class=\"icon80_smile\"></i></span><div class=\"msg_content\"><h4>抱歉！你还没有核销权限！<br>请联系管理员添加权限。</h4></div></div></div>";
				echo $phtml;
				exit;
			}
		}else{
			$url = 'http://' . $_SERVER ['HTTP_HOST'].U('Portal/Wxvip/inteDestroy',array('accountid'=>$accountid));
			$this->tzurl($url,$accountid);
		}
	}
	// 积分核销页面
	public function hxpage(){
		$cardNum = I('cardNum');
		$publicid = I('publicid');

		$weObj = $this->init($publicid);
		$signPackage = $weObj->getJsSign();
		$this->assign ("signPackage",$signPackage);
		$this->getOpneid($publicid);
		$openid = cookie('openid');
		if (!empty($openid)) {
			$res_scan = M('wxuser')->where(array('openid'=>$openid))->field('isscan')->find();
			if ($res_scan['isscan']==1) {
				$res = M('vipdetail')->where(array('cardnumber'=>$cardNum,'publicid'=>$publicid))->field('id,name,cardnumber,bonus,cardid')->find();
				if (empty($res)) {
					$to = U('Portal/Wxvip/inteDestroy',array('accountid'=>$publicid));
					$this->error('没有此会员卡',$to);
					exit();
				}
				$res_card = M('wxvipcard')->where(array('cardid'=>$res['cardid']))->field('title,logo_url')->find();
				$this->assign('res',$res);
				$this->assign('res_card',$res_card);
				$this->display();
			}else{
				$phtml = "<title>抱歉，出错了</title><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=0\"><link rel=\"stylesheet\" type=\"text/css\" href=\"https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\">";
				$phtml .= "<div class=\"page_msg\"><div class=\"inner\"><span class=\"msg_icon_wrp\"><i class=\"icon80_smile\"></i></span><div class=\"msg_content\"><h4>抱歉！你还没有核销权限！<br>请联系管理员添加权限。</h4></div></div></div>";
				echo $phtml;
				exit;
			}
		}else{
			$url = 'http://' . $_SERVER ['HTTP_HOST'].U('Portal/Wxvip/inteDestroy',array('accountid'=>$accountid));
			$this->tzurl($url,$accountid);
		}
	}

	// 更改会员卡积分
	public function setMemberCard(){
		$id = I('id');
		$vipbonus = I('vipbonus');
		$bonche = I('bonche');
		$remark = I('remark');
		$openid = cookie('openid');

		$res = M('vipdetail')->where(array('id'=>$id))->find();
		if ($bonche=="1") {
			$bonus = $res['bonus']+$vipbonus;
		}else{
			$bonus = $res['bonus']-$vipbonus;
		}
		$code = $res['cardcode'];
		$data = array(
			'card_id' => $res['cardid'],
			'code' => $code,
			'bonus' => $bonus
			);
		$weObj = $this->init($res['publicid']);
		$result = $weObj->updateMemberCard($data);
		if ($result) {
			$data['bonus'] = $result['result_bonus'];
			M('vipdetail')->where(array('id'=>$id))->save($data);
			$jfhx = array(
				'jf' => $vipbonus,
				'jftype' => $bonche,
				'remark' => $remark,
				'openid' => $openid,
				'createtime' => date('Y-m-d H:i:s',time())
				);
			M('wxjfhx')->add($jfhx);
		}
		$this->ajaxReturn($result);
	}

	// 删除会员卡
	public function delcard(){
		$wxvipcard_table = M('wxvipcard');
		$id = I('id');
		$map['id'] = $id;
		$res = $wxvipcard_table->field('id,publicid,cardid')->where($map)->find();
		$publicid = $res['publicid'];
		$cardid = $res['cardid'];
		$weObj = $this->init($publicid);
		/*$weObj = $this->init(2);
		$cardid = ['p8t4Qt51YTyr1yVmpx-kh6Rzaxqw'];
		for ($i=0; $i <= count($cardid); $i++) { 
			$weObj->delCard($cardid[$i]);
		}
		exit('ok');*/
		$isdelete = $weObj->delCard($cardid);
		if ($isdelete) {
			$isde = $wxvipcard_table->where($map)->delete();
			if ($isde!==false) {
				$this->success("删除成功！");
			}else{
				$this->error("删除失败！");
			}
		}
	}

	// 图片下载
	public function downloadImg(){
		$filename = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHx7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc040TFozT3U4Z1Qxdmt6aWhyNE0AAgRUsHFZAwSAM_EB';
		header('content-disposition:attachment;filename='. basename($filename));
		header('content-length:'. filesize($filename));
		header("Content-Disposition: attachment; filename=二维码.jpg");
		readfile($filename);
		exit();
	}
	// 会员卡背景图片
	public function uploadimg($publicid,$imgurl){
		$imgpath = $_SERVER['DOCUMENT_ROOT'].'/data/upload/'.$imgurl;
		$type = 'image';
		$weObj = $this->init($publicid);
		if (class_exists('\CURLFile')) {  
		    $data = array('media' => new \CURLFile(realpath($imgpath)));  
		}else{  
		    $data = array('media' => '@'.realpath($imgpath));  
		} 
		$res = $weObj->uploadForeverMedia($data,$type);
		return $res['url'];

		/*$weObj = $this->init(2);
		$token = $weObj->checkAuth();
		$url = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=".$token."&type=image";  
		if (class_exists('\CURLFile')) {  
		    $josn = array('media' => new \CURLFile(realpath($imgpath)));  
		} else {  
		    $josn = array('media' => '@' . realpath($imgpath));  
		}  
		  
		$ret = $this->curl_post($url,$josn);  
		$row = json_decode($ret);//对JSON格式的字符串进行编码  
		// echo '此素材的唯一标识符media_id为：'.$row->media_id;
		//得到上传素材后，此素材的唯一标识符media_id
		var_dump($row);*/
	}

	public function curl_post($url, $data = null){
		//创建一个新cURL资源  
	    $curl = curl_init();  
	    //设置URL和相应的选项   
	    curl_setopt($curl, CURLOPT_URL, $url);  
	    if (!empty($data)){  
	        curl_setopt($curl, CURLOPT_POST, 1);  
	        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);  
	    }  
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);  
	    //执行curl，抓取URL并把它传递给浏览器  
	    $output = curl_exec($curl);  
	    //关闭cURL资源，并且释放系统资源  
	    curl_close($curl);  
	    return $output;
	}

	function base64EncodeImage($image_file) {
		$base64_image = '';
		$image_info = getimagesize($image_file);
		$image_data = fread(fopen($image_file, 'r'), filesize($image_file));
		$base64_image = 'data:'.$image_info['mime'].';base64,'.chunk_split(base64_encode($image_data));
		return $base64_image; 
	}
}


