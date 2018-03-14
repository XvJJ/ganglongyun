<?php
namespace Portal\Controller;
use Common\Controller\HomebaseController; 

class ApiController extends HomebaseController {

	protected $tmlist_table;
	
	public function _initialize() {
		$this->tmlist_table = M("tmlist");
	}
	
	public function hospitaltest_api() {
		header('Content-Type:text/html;charset=utf-8');
		$type = I('type');
		$res = $this->tmlist_table->select();
		$this->ajaxReturn($res,$type);
		// exit(json_encode($res));
    }

    public function pdata(){
		header('Content-Type:text/html;charset=utf-8');
    	// $data1 = $GLOBALS['HTTP_RAW_POST_DATA'];
    	// $data2 = file_get_contents("php://input");
    	$appid = I('appid');
    	$token = I('token');
    	if ($appid=='wx1234567' && $token=='wxsSdftre24ytu3y2ui3ue4or4') {
    		$res = $this->tmlist_table->select();
    	}else{
    		$res = array('error'=>400001,'msg'=>'Token错误');
    	}
    	$this->ajaxReturn($res,$type);
    }

    public function test(){
		$url = 'http://ywj.ganglongyun.com/index.php?g=portal&m=api&a=hospitaltest_api';
		$res = $this->http_get($url);
		$url_post = 'http://ywj.ganglongyun.com/index.php?g=portal&m=api&a=pdata';
		$data = array(
			'appid' => 'wx123456',
			'token' => 'wxsSdftre24ytu3y2ui3ue4or4',
			);
		$res_post = $this->http_post($url_post,$data);
		var_dump($res);
		echo "<br>--------<br>";
		var_dump($res_post);
	}

	public function http_get($url){
		$oCurl = curl_init();
		if(stripos($url,"https://")!==FALSE){
			curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
			curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
			curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
		}
		curl_setopt($oCurl, CURLOPT_URL, $url);
		curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
		$sContent = curl_exec($oCurl);
		$aStatus = curl_getinfo($oCurl);
		curl_close($oCurl);
		if(intval($aStatus["http_code"])==200){
			return $sContent;
		}else{
			return false;
		}
	}

	public function http_post($url,$param,$post_file=false){
		$oCurl = curl_init();
		if(stripos($url,"https://")!==FALSE){
			curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
			curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, false);
			curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
		}
		if (is_string($param) || $post_file) {
			$strPOST = $param;
		} else {
			$aPOST = array();
			foreach($param as $key=>$val){
				$aPOST[] = $key."=".urlencode($val);
			}
			$strPOST =  join("&", $aPOST);
		}
		curl_setopt($oCurl, CURLOPT_URL, $url);
		curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($oCurl, CURLOPT_POST,true);
		curl_setopt($oCurl, CURLOPT_POSTFIELDS,$strPOST);
		$sContent = curl_exec($oCurl);
		$aStatus = curl_getinfo($oCurl);
		curl_close($oCurl);
		if(intval($aStatus["http_code"])==200){
			return $sContent;
		}else{
			return false;
		}
	}	
}
