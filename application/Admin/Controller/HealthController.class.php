<?php
/**
 * 后台首页
 */
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class HealthController extends AdminbaseController {

	protected $diseasetype_table;
	protected $hospital_table;
	protected $tmlist_table;
	
	public function _initialize() {
	    empty($_GET['upw'])?"":session("__SP_UPW__",$_GET['upw']);//设置后台登录加密码	    
		parent::_initialize();
		$this->initMenu();
		$this->diseasetype_table = M("diseasetype");
		$this->hospital_table = M("hospital");
		$this->tmlist_table = M("tmlist");
	}
	
	// 健康自测题目种类
    public function index() {
    	$res = $this->diseasetype_table->select();
    	$this->assign('res',$res);
       	$this->display();
    }

    public function add(){
    	$res = $this->hospital_table->field('id,name')->select();
		$this->assign('res',$res);
       	$this->display();
    }

    public function edit(){
    	$id = I('id');
    	$res1 = $this->hospital_table->field('id,name')->select();
    	$res2 = $this->diseasetype_table->where(array('id'=>$id))->find();
		$this->assign('res1',$res1);
		$this->assign('res2',$res2);
       	$this->display();
    }

    public function post(){
    	$id = I('id');
    	$data = array(
    		'disease' => I('name'),
    		'hospitalid' => I('hospitalid'),
    		'a' => I('xxa'),
    		'b' => I('xxb'),
    		'c' => I('xxc'),
    		'd' => I('xxd'),
    		'e' => I('xxe'),
    		'f' => I('xxf')
    		);
    	if (empty($id)) {
    		$this->diseasetype_table->add($data);
    		$this->success("添加成功！");
    	}else{
    		$this->diseasetype_table->where(array('id'=>$id))->save($data);
    		$this->success("修改成功！");
    	}
    }

    public function delete(){
		$id = I("id");
		if ($this->diseasetype_table->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}

    // 健康自测题列表
    public function health() {
    	$res = $this->tmlist_table->select();
    	$this->assign('res',$res);
       	$this->display();
    }

    public function tmadd(){
    	$res1 = $this->diseasetype_table->field('id,disease')->select();
		$this->assign('res1',$res1);
    	$this->display();
    }

    public function tmedit(){
    	$id = I('id');
    	$res1 = $this->diseasetype_table->field('id,disease')->select();
    	$res2 = $this->tmlist_table->where(array('id'=>$id))->find();
		$this->assign('res1',$res1);
		$this->assign('res2',$res2);
    	$this->display();
    }

    public function tmpost(){
    	$id = I('id');
    	$data = array(
    		'tmname'=>I('tmname'),
    		'tmtypeid'=>I('tmtypeid'),
    		'answer1'=>I('answer1'),
    		'answer2'=>I('answer2'),
    		'answer3'=>I('answer3'),
    		'answer4'=>I('answer4'),
    		'answer5'=>I('answer5'),
    		'answer6'=>I('answer6')
    	);
    	if (empty($id)) {
    		$this->tmlist_table->add($data);
    		$this->success("添加成功！");
    	}else{
    		$this->tmlist_table->where(array('id'=>$id))->save($data);
    		$this->success("修改成功！");
    	}
    }

    public function tmdelete(){
		$id = I("id");
		if ($this->tmlist_table->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}
}

