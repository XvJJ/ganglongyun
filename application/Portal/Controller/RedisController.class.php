<?php
namespace Portal\Controller;
use Common\Controller\HomebaseController;
/**
 * 首页
 */
class RedisController extends HomebaseController {

	// redis测试
	public function index() {
		// require 'simplewind/Core/Library/Think/Cache/Driver/Redis.class.php';
		// import('simplewind.Core.Library.Think.Cache.Driver.Redis');
        // Vendor('Redis.Redis');
		$redis = new \Redis();
		$redis->connect('127.0.0.1',6379);
		$redis->set('Name','张三');
		/*$redis->lpush("tutorial-list", "Redis"); 
		$redis->lpush("tutorial-list", "Mongodb"); 
		$redis->lpush("tutorial-list", "Mysql");  
		$redis->lpush("tutorial-list", "PHP");*/ 
		$redis->set("arr", json_encode(array('name'=>'lisi','id'=>0002)));
		$redis->sadd("num", array('name'=>'lisi','id'=>0002));
		$redis->sadd("num", '123');

		$arList = $redis->lrange("tutorial-list",0,15);
		// $redis->lgetrange("tutorial-list",0,-1);
		$allkey = $redis->keys("*");
		// $redis->delete('tutorial-list');
		$arr = $redis->smembers('num');
		$arr1 = $redis->get('arr');

	    var_dump($arList);
	    var_dump($allkey);
	    var_dump($arr);
	    var_dump($arr[1]);
	    var_dump(json_decode($arr1,true));
		echo '<br><br>姓名：'.$redis->get('Name').'<br><br>年龄：'.$redis->get('age'); 
    }

    // 密文改变
	function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {   
	    // 动态密匙长度，相同的明文会生成不同密文就是依靠动态密匙   
	    $ckey_length = 4;   
	    // 密匙   
	    $key = md5($key ? $key : $GLOBALS['discuz_auth_key']);   
	    // 密匙a会参与加解密   
	    $keya = md5(substr($key, 0, 16));   
	    // 密匙b会用来做数据完整性验证   
	    $keyb = md5(substr($key, 16, 16));   
	    // 密匙c用于变化生成的密文   
	    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length):substr(md5(microtime()), -$ckey_length)) : '';   
	    // 参与运算的密匙   
	    $cryptkey = $keya.md5($keya.$keyc);   
	    $key_length = strlen($cryptkey);   
	    // 明文，前10位用来保存时间戳，解密时验证数据有效性，10到26位用来保存$keyb(密匙b)， 
		//解密时会通过这个密匙验证数据完整性   
	    // 如果是解码的话，会从第$ckey_length位开始，因为密文前$ckey_length位保存 动态密匙，以保证解密正确   
	    $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)):sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;   
	    $string_length = strlen($string);   
	    $result = '';   
	    $box = range(0, 255);   
	    $rndkey = array();   
	    // 产生密匙簿   
	    for($i = 0; $i <= 255; $i++) {   
	        $rndkey[$i] = ord($cryptkey[$i % $key_length]);   
	    }   
	    // 用固定的算法，打乱密匙簿，增加随机性，好像很复杂，实际上对并不会增加密文的强度   
	    for($j = $i = 0; $i < 256; $i++) {   
	        $j = ($j + $box[$i] + $rndkey[$i]) % 256;   
	        $tmp = $box[$i];   
	        $box[$i] = $box[$j];   
	        $box[$j] = $tmp;   
	    }   
	    // 核心加解密部分   
	    for($a = $j = $i = 0; $i < $string_length; $i++) {   
	        $a = ($a + 1) % 256;   
	        $j = ($j + $box[$a]) % 256;   
	        $tmp = $box[$a];   
	        $box[$a] = $box[$j];   
	        $box[$j] = $tmp;   
	        // 从密匙簿得出密匙进行异或，再转成字符   
	        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));   
	    }   
	    if($operation == 'DECODE') {  
	        // 验证数据有效性，请看未加密明文的格式   
	        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {   
	            return substr($result, 26);   
	        } else {   
	            return '';   
	        }   
	    } else {   
	        // 把动态密匙保存在密文里，这也是为什么同样的明文，生产不同密文后能解密的原因   
	        // 因为加密后的密文可能是一些特殊字符，复制过程可能会丢失，所以用base64编码   
	        return $keyc.str_replace('=', '', base64_encode($result));   
	    }   
	} 

	// 密文不改变
	function encrypt($string,$operation,$key=''){ 
	    $key=md5($key); 
	    $key_length=strlen($key); 
	      $string=$operation=='D'?base64_decode($string):substr(md5($string.$key),0,8).$string; 
	    $string_length=strlen($string); 
	    $rndkey=$box=array(); 
	    $result=''; 
	    for($i=0;$i<=255;$i++){ 
	           $rndkey[$i]=ord($key[$i%$key_length]); 
	        $box[$i]=$i; 
	    } 
	    for($j=$i=0;$i<256;$i++){ 
	        $j=($j+$box[$i]+$rndkey[$i])%256; 
	        $tmp=$box[$i]; 
	        $box[$i]=$box[$j]; 
	        $box[$j]=$tmp; 
	    } 
	    for($a=$j=$i=0;$i<$string_length;$i++){ 
	        $a=($a+1)%256; 
	        $j=($j+$box[$a])%256; 
	        $tmp=$box[$a]; 
	        $box[$a]=$box[$j]; 
	        $box[$j]=$tmp; 
	        $result.=chr(ord($string[$i])^($box[($box[$a]+$box[$j])%256])); 
	    } 
	    if($operation=='D'){ 
	        if(substr($result,0,8)==substr(md5(substr($result,8).$key),0,8)){ 
	            return substr($result,8); 
	        }else{ 
	            return''; 
	        } 
	    }else{ 
	        return str_replace('=','',base64_encode($result)); 
	    } 
	} 

	public function test(){
		$str1 = '123'; 
		$key1 = 'miyaofgkdslgj'; 
		$newstr = $this->authcode($str1,'ENCODE',$key1,0); //加密
		/*echo $newstr."<br>------<br>";
		echo $this->authcode($newstr,'DECODE',$key1,0)."<br>"; //解密*/

		$str2 = 'abcd';
		$key2 = 'www.helloweba.com'; 
		$token = $this->encrypt($str2, 'E', $key2); 
		/*echo '加密:'.$token.'<br>'; 
		echo '解密：'.$this->encrypt($token, 'D', $key2);*/

		echo "<br>加密综合<br>";
		$str3 = 'ymwj';
		$gdstr3 = $this->encrypt($str3, 'E', $key2);
		$newstr3 = $this->authcode($gdstr3,'ENCODE',$key1,0);
		echo "字符加密后的密文是：<br>".$newstr3."<br>";
		$jm1 = $this->authcode($newstr3,'DECODE',$key1,0);
		$jm2 = $this->encrypt($jm1, 'D', $key2);
		echo "密文解密后的字符是：<br>".$jm2."<br>";
	}

	// 事务测试
	public function transTest(){
		$zjmd = M('zjmd');
		$wxuser = M('wxuser');
		$wxuser->startTrans();
		$res_zjmd = $zjmd->where(array('id'=>10))->find();
		$res_wxuser = $wxuser->where(array('id'=>2))->delete();
		if (!empty($res_zjmd)) {
			$wxuser->commit();
			echo "删除成功";
		}else{
			$wxuser->rollback();
			echo "删除失败";
		}
	}

}


