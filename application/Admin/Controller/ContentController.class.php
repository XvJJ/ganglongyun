<?php
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class ContentController extends AdminbaseController {
    
	protected $flarticle_table;
	protected $hospital_table;
    protected $department_table;
    protected $disease_table;
	
	function _initialize() {
		parent::_initialize();
		$this->flarticle_table = M("article1");
		$this->hospital_table = M("hospital");
        $this->department_table = M("department");
        $this->disease_table = M("diseases");
	}
	
	// 后台文章分类管理
	public function article(){
		$hospitalid = I('hospitalid');
		$start_time = I('start_time');
		$end_time = I('end_time');
		$keyword = I('keyword');

    	if (!empty($hospitalid)) {
    		$map['hospitalid'] = $hospitalid;
    		$this->assign('hospitalid',$hospitalid);
    	}
    	if (!empty($start_time)&&!empty($end_time)) {
    		$map['post_modified'] = array('between',array($start_time,$end_time));;
    		$this->assign('start_time',$start_time);
    		$this->assign('end_time',$end_time);
    	}
    	if (!empty($keyword)) {
    		$map['post_content'] = array('like','%'.$keyword.'%');
    		$this->assign('keyword',$keyword);
    	}
		$res1 = $this->hospital_table->field('id,name')->select();
		$res2 = $this->flarticle_table->where($map)->select();
		foreach ($res2 as $k => & $v) {
			$hos_name = $this->hospital_table->where(array('id'=>$v['hospitalid']))->field('name')->find();
			$v['hospitalid'] = $hos_name['name'];
		}
		$this->assign('res1',$res1);
		$this->assign('res2',$res2);
		// var_dump($res);exit();
		$this->display();
	}

	// 文章添加
	public function add(){
		$res = $this->hospital_table->field('id,name')->select();
		$this->assign('res',$res);
		$this->display();
	}
	
	// 文章编辑
	public function edit(){
		$id = I('id');
		$res_hos = $this->hospital_table->field('id,name')->select();
		$res2 = $this->flarticle_table->where(array('id'=>$id))->find();
		$articletype = explode(',',$res2['articletype']);
        $res_dpmall = $this->department_table->where(array('parentid'=>0,'hospitalid'=>$res2['hospitalid']))->field('id,name')->select();
        $res_dpmaks = $this->department_table->where(array('parentid'=>$articletype[0],'hospitalid'=>$res2['hospitalid']))->field('id,name')->select();

        $res_disall = $this->disease_table->select();

        $this->assign('articletype',$articletype);
        $this->assign('res_dpmaks',$res_dpmaks);
        $this->assign('res_dpmall',$res_dpmall);
        $this->assign('res_disall',$res_disall);
        $this->assign('res_hos',$res_hos);
		$this->assign('res2',$res2);
		$this->display();
	}

	// 文章添加提交
	public function post(){
		$id = I('id');
		$_POST['post']['post_modified']=date("Y-m-d H:i:s",time());
		$_POST['post']['post_author']=get_current_admin_id();
		$article=I("post.post");
		$article['smeta']=$_POST['smeta']['thumb'];
		$article['hospitalid']=$_POST['hospitalid'];
		$article['articletype']=$_POST['parentid'].','.$_POST['ppid'].','.$_POST['pppid'];
		$article['post_content']=htmlspecialchars_decode($article['post_content']);
		
		if (empty($id)) {
            // var_dump($article);exit();
    		$this->flarticle_table->add($article);
    		$this->success("添加成功！");
    	}else{
    		// var_dump($article);exit();
    		$this->flarticle_table->where(array('id'=>$id))->save($article);
    		$this->success("修改成功！");
    	}
	}
	
	// 文章删除
	public function delete(){
		$id = I("id");
		if ($this->flarticle_table->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}
}