<?php
namespace Portal\Controller;
use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class WechatController extends HomebaseController {
	public function init($accountid) {
		vendor('wechat');
		// require 'simplewind/Core/Library/Vendor/wechat.php';
		$config = M("wxconfig")->where(array("id"=>$accountid))->find();
		//file_put_contents('1234.txt',$config);
		$options = array(
				'token' => $config ["token"], // 填写你设定的key
				'encodingaeskey' => $config ["encodingaeskey"], // 填写加密用的EncodingAESKey
				'appid' => $config ["appid"], // 填写高级调用功能的app id
				'appsecret' => $config ["appsecret"], // 填写高级调用功能的密钥
		);
		//print_r($config);exit;
		$weObj = new \Wechat ( $options );
		//file_put_contents('123.txt',$options);
		return $weObj;
	}
	
	public function traceHttp()
	{
		$this->logger("\n\nREMOTE_ADDR:".$_SERVER["REMOTE_ADDR"].(strstr($_SERVER["REMOTE_ADDR"],'101.226')? " FROM WeiXin": "Unknown IP"));
		$this->logger("QUERY_STRING:".$_SERVER["QUERY_STRING"]);
	}
	public function logger($log_content)
	{
		if(isset($_SERVER['HTTP_APPNAME'])){   //SAE
			sae_set_display_errors(false);
			sae_debug($log_content);
			sae_set_display_errors(true);
		}else{ //LOCAL
			$max_size = 500000;
			$log_filename = "log.xml";
			if(file_exists($log_filename) and (abs(filesize($log_filename)) > $max_size)){unlink($log_filename);}
			file_put_contents($log_filename, date('Y-m-d H:i:s').$log_content."\r\n", FILE_APPEND);
		}
	}


	public function index() {
		$accountid=$_GET['accountid'];
		$weObj = $this->init($accountid);
		// var_dump($weObj);exit();
		// $this->traceHttp();
		$weObj->valid();
		$type1 = $weObj->getRev();
		$type = $type1->getRevType();
		// $events = $weObj->getRev()->getRevEvent();
		$events = $weObj->getRevEvent();
		$openid_new = $weObj->getRevFrom();

		$new_event =$events['event'];
		$hfc = M('wxconfig')->where(array('id'=>$accountid))->field('hftext')->find();

		// $localEvent = $weObj->getRevEventGeo();
		
		switch ($type) {
			case 'text' :
				$key = $weObj->getRev()->getRevContent();
				$map['accountid']=$accountid;
				$map['keywords'] = array('like','%'.$key.'%');
				$res_replay = M("wxmessage")->where($map)->field('keywords,content')->find();
    			$xs = similar_text($res_replay['keywords'], $key);
				if ($xs>=1) {
					$weObj->text($res_replay['content'])->reply();
				}elseif($key=='核销'){
					$hfurl = 'http://' . $_SERVER ['HTTP_HOST'].U('Portal/Wxvip/inteDestroy',array('accountid'=>$accountid));
					$weObj->text('<a href="'.$hfurl.'">点击核销</a>')->reply();
				}else{
					$weObj->text("不是关键字")->reply();
				}
				exit;
				break;
			case 'event' :
				if ($new_event == "subscribe") {
    				$hfcontent = $weObj->text($hfc['hftext']);
    				$hfcontent->reply();
					$this->getwxuserinfo($openid_new,$accountid);
				}elseif ($new_event == "unsubscribe") {
					$data['isguanzhu'] = 0;
					M('wxuser')->where(array('openid'=>$openid_new))->save($data);
				}elseif ($new_event == "user_get_card") {
					$res_crad = $weObj->getRevCardGet();
					$getopenid = $weObj->getRevFrom();
					cookie('openid',$getopenid);
					$this->getVipdetail($res_crad,$getopenid,$accountid);
					$weObj->text ("您领取了会员卡，卡号是：".$res_crad['UserCardCode']."卡券ID：".$res_crad['CardId']."领券方的openid：".$getopenid."来源场景：".$res_crad['OuterStr'])->reply();
				}elseif ($new_event == "user_del_card") {
					$getopenid = $weObj->getRevFrom();
					$map_vip['openid'] = $getopenid;
					$datavip['IsRestoreMemberCard'] = 0;
					M('vipdetail')->where($map_vip)->save($datavip);
					$weObj->text ( "您删除了会员卡" )->reply();
				}elseif ($new_event == "LOCATION") {
					// $geo = $weObj->getRevGeo();
					$geo = $weObj->getRevEventGeo();
					$hfcontent = $weObj->text('你上报了地理位置：X='.$geo['x'].',Y='.$geo['y']);
    				$hfcontent->reply();
				}
				exit;
				break;
			default :
				$weObj->text ( "help info" )->reply();
		}
	}
	
	public function getwxuserinfo($openid,$accountid) {
		//此处用来获得openid等微信会员信息，并且写入数据库
		$weObj = $this->init($accountid);
		//file_put_contents("1.txt", var_export($res,true));
		//如果openid在会员表中存在，则不写入
		$isop = M("wxuser")->where(array("openid" => $openid))->find();
		$resuserinfo = $weObj->getUserInfo($openid);
		//新的openid就写入
		if (empty($isop)){
			$data ["typeid"] = 0;
			$data ["openid"] = $resuserinfo['openid'];
			$data ["nickname"] = $resuserinfo['nickname'];
			$data ["sex"] = $resuserinfo['sex'];
			$data ["province"] = $resuserinfo['province'];
			$data ["city"] = $resuserinfo['city'];
			$data ["headimgurl"] = $resuserinfo['headimgurl'];
			$data ["unionid"] = $resuserinfo['unionid'];
			$data ["time"] = date("Y-m-d H:i:s", time());
			$data ["isguanzhu"] = 1;
			$data ["publicid"] = $accountid;
			//print_r($data);exit;
			cookie('openid',$resuserinfo['openid']);
			$lastInsId = M ("wxuser")->add($data);
		}else{
			//已经有openid的就更新,因为粉丝信息会更改
			$Dao = M("wxuser");
			$data ["nickname"] = $resuserinfo['nickname'];
			$data ["sex"] = $resuserinfo['sex'];
			$data ["province"] = $resuserinfo['province'];
			$data ["city"] = $resuserinfo['city'];
			$data ["headimgurl"] = $resuserinfo['headimgurl'];
			$data ["time"] = date("Y-m-d H:i:s", time());
			$data ["isguanzhu"] = 1;  //通过关注事件来的，统一标注为已关注
			$data ["publicid"] = $accountid;
			$condition['openid'] = $isop['openid'];  //更新条件
			cookie('openid',$resuserinfo['openid']);
			$resultwxuser = $Dao->where($condition)->save($data);
		}
	}

	// 会员卡信息
	public function getVipdetail($res_crad,$getopenid,$accountid){
		$vipdetail_table = M('vipdetail');
		$Dao = M("wxuser");

		$map['openid'] = $getopenid;
		$map['accountid'] = $accountid;
		$res = $vipdetail_table->where($map)->field('openid,isjihuo')->find();
		// 会员信息填写或更新到会员表中
		if (empty($res)) {
			$data_vip = array(
				'cardcode' => $res_crad['UserCardCode'],
				'cardid' => $res_crad['CardId'],
				'openid' => $getopenid,
				'OuterStr' => $res_crad['OuterStr'],
				'IsRestoreMemberCard' => 1,
				'isjihuo' => 0,
				'publicid' => $accountid,
				'caeattime' => date("Y-m-d")
			);
			$vipdetail_table->add($data_vip);
		}else{
			$datavip['IsRestoreMemberCard'] = 1;
			$datavip['isjihuo'] = $res['jihuo'];
			$datavip['cardcode'] = $res_crad['UserCardCode'];
			$datavip['OuterStr'] = $res_crad['OuterStr'];
			$vipdetail_table->where($map)->save($datavip);
		}
		// 会员信息写入到粉丝表中
		$weObj = $this->init($accountid);
		$isop = $Dao->where(array("openid" => $getopenid))->find();
		$resuserinfo = $weObj->getUserInfo($getopenid);
		//新的openid就写入
		if (empty($isop)){
			$data ["typeid"] = 0;
			$data ["openid"] = $resuserinfo['openid'];
			$data ["nickname"] = $resuserinfo['nickname'];
			$data ["sex"] = $resuserinfo['sex'];
			$data ["province"] = $resuserinfo['province'];
			$data ["city"] = $resuserinfo['city'];
			$data ["headimgurl"] = $resuserinfo['headimgurl'];
			$data ["unionid"] = $resuserinfo['unionid'];
			$data ["time"] = date("Y-m-d H:i:s", time());
			$data ["isguanzhu"] = 0;
			$data ["publicid"] = $accountid;
			cookie('openid',$resuserinfo['openid']);
			$lastInsId = $Dao->add($data);
		}else{
			$data ["nickname"] = $resuserinfo['nickname'];
			$data ["sex"] = $resuserinfo['sex'];
			$data ["province"] = $resuserinfo['province'];
			$data ["city"] = $resuserinfo['city'];
			$data ["headimgurl"] = $resuserinfo['headimgurl'];
			$data ["time"] = date("Y-m-d H:i:s", time());
			$data ["isguanzhu"] = 1;  //通过关注事件来的，统一标注为已关注
			$data ["publicid"] = $accountid;
			$condition['openid'] = $isop['openid'];  //更新条件
			cookie('openid',$resuserinfo['openid']);
			$resultwxuser = $Dao->where($condition)->save($data);
		}
	}

	// 创建微信自定义菜单
	public function createMenu() {
		//获取一级菜单目录
		$menu=M('wxmenu')->where(array('parentid'=>0))->select();
		$newmenu["button"] = array();
		foreach ($menu as $key => & $v) {
			$childmenu=M('wxmenu')->where(array('parentid'=>$v['id']))->select();
			$newchild=array();
			if($childmenu){
				foreach ($childmenu as $key =>& $vv) {
                   if($vv['type']=="view"){
                   	  array_push($newchild,array('type'=>"view",'name'=>$vv["name"],'url'=>$vv["url"]));
                   }else if($vv['type']=="click"){
                   	  array_push($newchild,array('type'=>"click",'name'=>$vv["name"],'key'=>$vv["key"]));
                   }else if($vv['type']=="scancode_push"){
                   	  array_push($newchild,array('type'=>"scancode_push",'name'=>$vv["name"],'key'=>$vv["key"]));
                   }
				}
				array_push($newmenu["button"],array('name'=>$v["name"],'sub_button'=>$newchild));

			}else{
				if($v['type']=="view"){
               	   array_push($newmenu["button"],array('type'=>"view",'name'=>$v["name"],'url'=>$v["url"]));
                }else if($vv['type']=="click"){
               	   array_push($newmenu["button"],array('type'=>"click",'name'=>$v["name"],'key'=>$v["key"]));
                }else if($vv['type']=="scancode_push"){
                   array_push($newmenu["button"],array('type'=>"scancode_push",'name'=>$v["name"],'key'=>$v["key"]));
                }
			}
		}
		$accountid = I('accountid');
        $weObj = $this->init($accountid);
		//print_r($weObj);exit;
        $weObj->createMenu($newmenu);
        $this->success("重新创建菜单成功!");
	}
	// 模板消息测试
	public function testsend(){
		$weObj = $this->init(1);
		$data = array(
			'touser' => 'osAvDuCUWmJTAIBJb13vl51PR51s',
			'template_id' => 'GAchNaTwlKbW_9Qs6Oo9YO3SHj7qFWjqS5y5YNIxm9Q',
			'url' => 'http://www.baidu.com',
			'topcolor' => "#FF0000"
			);
		$weObj->sendTemplateMessage($data);
		echo "ok";
	}

	// 获取openid并更新此人的微信信息到表中
	public function getOpneid($accountid){
		$weObj = $this->init($accountid);
		$wxuser_table = M('wxuser');
		$openid = cookie('openid');
		if (!empty($openid)) {
			// 更新此人信息
			$wxuser = $weObj->getUserInfo($openid);
			$data ["nickname"] = $wxuser['nickname'];
			$data ["sex"] = $wxuser['sex'];
			$data ["province"] = $wxuser['province'];
			$data ["city"] = $wxuser['city'];
			$data ["headimgurl"] = $wxuser['headimgurl'];
			$data ["time"] = date("Y-m-d H:i:s", time());
			$data ["publicid"] = $accountid;
			$condition['openid'] = $openid;  //更新条件
			// cookie('openid',$openid);
			$wxuser_table->where($condition)->save($data);
			return $openid;
		}else{
			$res = $weObj->getOauthAccessToken();
			$unopenid = $res['openid'];
			$wxuser = $weObj->getUserInfo($unopenid);
			$data ["typeid"] = 0;
			$data ["openid"] = $wxuser['openid'];
			$data ["nickname"] = $wxuser['nickname'];
			$data ["sex"] = $wxuser['sex'];
			$data ["province"] = $wxuser['province'];
			$data ["city"] = $wxuser['city'];
			$data ["headimgurl"] = $wxuser['headimgurl'];
			$data ["unionid"] = $wxuser['unionid'];
			$data ["time"] = date("Y-m-d H:i:s", time());
			$data ["isguanzhu"] = 0;
			$data ["publicid"] = $accountid;
			cookie('openid',$unopenid);
			$wxuser_table->add($data);
			return $unopenid;
		}
	}

	// 获取openid
	public function getOpneid_bak($accountid){
		$openid = cookie('openid');
		if (!empty($openid)) {
			return $openid;
		}else{
			$weObj = $this->init($accountid);
			$res = $weObj->getOauthAccessToken();
			// $getopenid = $weObj->getRevFrom();
			cookie('openid',$res['openid']);
			return $res['openid'];
		}

	}

	function is_weixin(){  
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {  
			return true;  
		}    
		return false;  
	}

	public function tzurl($url,$accountid) {
		$weObj = $this->init ($accountid);
		$newurl = $weObj->getOauthRedirect($url,'','snsapi_base');
		header("Location: ".$newurl); 
		exit;
	}
}


