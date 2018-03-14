<?php
namespace Portal\Controller;
// use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class EmailController extends WechatController {

	public function index(){
		$weObj = $this->init(2);
		$signPackage = $weObj->getJsSign();
		$this->assign ("signPackage",$signPackage);

		$set_total = I('setredis_total');
		$end_time = '2017-09-10 23:59:59';
		$nowdatetime = date('Y-m-d H:i:s');

		$sumsec = strtotime($end_time)-strtotime($nowdatetime);		

		$redis = new \Redis();
		$redis->connect('127.0.0.1',6379);
		if ($set_total) {
			$redis->set('total',$set_total);
		}
		// $redis->del('total');

		$total = $redis->get('total');
		// var_dump($total);exit();
		$this->assign('total',$total);
		$this->assign('sumsec',$sumsec);
    	$this->display();
	}

	public function ftotal(){
		ignore_user_abort(true);
		set_time_limit(0);
		// $interval=60*60*1;
		$interval=4200;
		$end_time = '2017-09-10 23:59:59';
		$nowdatetime = date('Y-m-d H:i:s');
		$sumsec = strtotime($end_time)-strtotime($nowdatetime);

		$redis = new \Redis();
		$redis->connect('127.0.0.1',6379);
		do{
			$i = rand(1,3);
			$total = $redis->get('total');
    		$num = intval($total) - $i;
    		if ($num<0) {
    			$redis->set('total',0);
    			break;exit();
    		}else{
    			$redis->set('total',$num);
    		}
			sleep($interval);
		}while (true);
		/*while ($total>0 && $sumsec>0) {
			$i = rand(1,3);
			$total = $redis->get('total');
    		$num = intval($total) - $i;
    		if ($total<0) {
    			$redis->set('total',0);
    		}else{
    			$redis->set('total',$num);
    		}
			sleep($interval);
		}
		exit();*/
	}

	public function index_post() {
		$weObj = $this->init(2);
		$signPackage = $weObj->getJsSign();
		$this->assign ("signPackage",$signPackage);
		header("Content-type: text/html; charset=utf-8");
		$end_time = '2017-09-10 23:59:59';
		$nowdatetime = date('Y-m-d H:i:s');
		$sumsec = strtotime($end_time)-strtotime($nowdatetime);

		$redis = new \Redis();
		$redis->connect('127.0.0.1',6379);
		$total = $redis->get('total');
		if ($total>0 && $sumsec>0) {
			$this->display();
		}else{
			echo "<h2 style='margin-top:100px;text-align: center;'>来晚了哟，已经不能抢了!</h2>";
		}
    }

    public function isverify(){
    	$verrify = I("post.verify");
    	if(empty($verrify)){
    		$this->error(L('CAPTCHA_REQUIRED'));
    	}
    	//验证码
    	if(!sp_check_verify_code()){
    		$dataMsg = array('msg'=>'fail');
            $this->ajaxReturn($dataMsg);
    	}else{
    		$dataMsg = array('msg'=>'ok');
            $this->ajaxReturn($dataMsg);
    	}
    }

    public function send(){
		if(IS_POST){
            $rules = array(
                 // array('to','require','收件箱不能为空！',1,'regex',3),
                 // array('to','email','收件箱格式不正确！',1,'regex',3),
                 // array('subject','require','标题不能为空！',1,'regex',3),
                 array('content','require','内容不能为空！',1,'regex',3),
            );
                        
            $model = M();
            if ($model->validate($rules)->create()!==false){
                $data=I('post.');
                $content = '姓名：'.$data['name'].'<br>电话：'.$data['tel'].'<br>内容：'.$data['content'];
                $verrify = I("post.verify");
		    	if(!sp_check_verify_code()){
		    		$dataMsg = array('msg'=>'verrifyfail');
		            $this->ajaxReturn($dataMsg);
		    	}else{
		    		$result=sp_send_email1($data['name'],'3206971818@qq.com', I('post.name'), $content);
		    	}
                if($result && empty($result['error'])){
                	$redis = new \Redis();
					$redis->connect('127.0.0.1',6379);
					$total = $redis->get('total');
					$redis->set('total',$total-1);

					$max_size = 500000;
					$log_filename = "EmailContent.txt";
					if(file_exists($log_filename) and (abs(filesize($log_filename)) > $max_size)){unlink($log_filename);}
					file_put_contents($log_filename, date('Y-m-d H:i:s').$content."\r\n", FILE_APPEND);
                	$dataMsg = array('msg'=>'ok');
                	$this->ajaxReturn($dataMsg);
                    // $this->success('发送成功！');
                }else{
                	$dataMsg = array('msg'=>'fail');
                	$this->ajaxReturn($dataMsg);
                    // $this->error('发送失败：'.$result['message']);
                }
            }else{
                $this->error($model->getError());
            }
        }
    }

}


