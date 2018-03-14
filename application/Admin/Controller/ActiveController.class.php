<?php
/**
 * 后台首页
 */
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class ActiveController extends AdminbaseController {
	
	public function _initialize() {
	    empty($_GET['upw'])?"":session("__SP_UPW__",$_GET['upw']);//设置后台登录加密码	    
		parent::_initialize();
		$this->initMenu();
	}

	public function index(){
		$config_table = M('wxconfig');
    	$publicid = I('publicid');
    	if (!empty($publicid)) {
    		$map['publicid'] = $publicid;
    		$this->assign('publicid',$publicid);
    	}
    	$res_pub = $config_table->field('id,name')->select();
    	$res = M('active')->where($map)->select();

    	$this->assign('res_pub',$res_pub);
    	$this->assign('res',$res);
		$this->display();
	}

	// 添加活动
	public function add(){
		$nowdate = date('Y-m-d H:i');
		$res_pub = M('wxconfig')->field('id,name')->select();

    	$this->assign('res_pub',$res_pub);
		$this->assign('nowdate',$nowdate);
		$this->display();
	}

	public function edit(){
		$id = I('id');
    	$res = M('active')->where(array('id'=>$id))->find();
    	$res_pub = M('wxconfig')->field('id,name')->select();
    	$this->assign('res',$res);
    	$this->assign('res_pub',$res_pub);
		$this->display();
	}

	public function post(){
    	$active_table = M('active');
		$id = I('id');
		$rule = htmlspecialchars_decode(I('rule'));
		$profile = htmlspecialchars_decode(I('profile'));
		if (empty($id)) {
			$data = array(
				'publicid' => I('publicid'),
				'name' => I('name'),
				'start_time' => I('start_time'),
				'end_time' => I('end_time'),
				'type' => I('type'),
				'num' => I('num'),
				'bgimg' => I('bgimg'),
				'rule' => $rule,
				'profile' => $profile,
				'numtype' => I('numtype')
				);
			// var_dump($data);exit();
			$active_table->add($data);
			$this->success("添加成功！");
		}else{
			$data = array(
				'publicid' => I('publicid'),
				'name' => I('name'),
				'start_time' => I('start_time'),
				'end_time' => I('end_time'),
				'type' => I('type'),
				'bgimg' => I('bgimg'),
				'rule' => $rule,
				'profile' => $profile,
				'num' => I('num'),
				'numtype' => I('numtype')
				);
			// var_dump($data);exit();
			$active_table->where(array('id'=>$id))->save($data);
			$this->success("修改成功！");
		}
	}
	// 活动删除
	public function delete(){
    	$id = I("id");
		if (M('active')->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
    }
	
	public function jp() {
		$res_hd = M('active')->select();
		$hdid = I('hdid');
		if (!empty($hdid)) {
			$map['hdid'] = $hdid;
			$this->assign('hdid',$hdid);
		}
		$res = M('prize')->where($map)->select();
    	$this->assign('res_hd',$res_hd);
    	$this->assign('res',$res);
		$this->display();		
    }
    // 添加奖品
    public function jpadd() {
    	$res_active = M('active')->field('id,name,publicid')->select();

    	$this->assign('res_active',$res_active);
		$this->display();		
    }

    public function jpedit() {
    	$id = I('id');
    	$res_active = M('active')->field('id,name,publicid')->find();
    	$res = M('prize')->where(array('id'=>$id))->find();
    	$this->assign('res',$res);
    	$this->assign('res_active',$res_active);
		$this->display();		
    }
    public function jppost(){
    	$prize_table = M('prize');
		$id = I('id');
		if (empty($id)) {
			$data = array(
				'publicid' => I('publicid'),
				'name' => I('name'),
				'bgcolor' => I('bgcolor'),
				'jpnum' => I('jpnum'),
				'zjnum' => I('zjnum'),
				'hdid' => I('hdid'),
				'proba' => I('proba')
				);
			// var_dump($data);exit();
			$prize_table->add($data);
			$this->success("添加成功！");
		}else{
			$data = array(
				'publicid' => I('publicid'),
				'name' => I('name'),
				'bgcolor' => I('bgcolor'),
				'jpnum' => I('jpnum'),
				'zjnum' => I('zjnum'),
				'hdid' => I('hdid'),
				'proba' => I('proba')
				);
			// var_dump($data);exit();
			$prize_table->where(array('id'=>$id))->save($data);
			$this->success("修改成功！");
		}
	}
    // 奖品删除
    public function jpdelete(){
    	$id = I("id");
		if (M('prize')->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
    }
    // 中奖名单
    public function zjmd(){
    	$prize_table = M('prize');
    	$hd_table = M('active');

    	$res_hd1 = $hd_table->select();
		$hdid = I('hdid');
		if (!empty($hdid)) {
			$map['hdid'] = $hdid;
			$this->assign('hdid',$hdid);
		}
    	
    	$res = M('zjmd')->where($map)->select();
    	foreach ($res as $k => & $v) {
    		$res_jp = $prize_table->where(array('id'=>$v['jpid']))->find();
    		$v['jpname'] = $res_jp['name'];
    		$res_hd = $hd_table->where(array('id'=>$res_jp['hdid']))->find();
    		$v['hdname'] = $res_hd['name'];
    		$v['publicid'] = $res_hd['publicid'];
    	}
    	$this->assign('res_hd',$res_hd1);
    	$this->assign('res',$res);
    	$this->display();
    }
}

