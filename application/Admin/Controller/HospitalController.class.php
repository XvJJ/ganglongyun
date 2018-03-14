<?php
/**
 * 后台首页
 */
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class HospitalController extends AdminbaseController {

    protected $hospital_table;
    protected $department_table;
    protected $disease_table;

	public function _initialize() {
	    empty($_GET['upw'])?"":session("__SP_UPW__",$_GET['upw']);//设置后台登录加密码	    
		parent::_initialize();
		$this->initMenu();

        $this->hospital_table = M("hospital");
        $this->department_table = M("department");
        $this->disease_table = M("diseases");
	}

    public function index() {
        $res = $this->hospital_table->select();
        $this -> assign('res',$res);
       	$this->display();
    }

    public function add(){
    	
    	$this->display();
    }

    public function edit(){
        $id = I('id');
    	$res = $this->hospital_table->where(array('id'=>$id))->find();
        $this -> assign('res',$res);
    	$this->display();
    }

    public function post(){
    	$hospital_table = $this->hospital_table;
    	$id = I('id');
    	$logo = $_POST['smeta']['thumb'];
        $data = array(
            'name' => I('name'),
            'tel' => I('tel'),
            'address' => I('address'),
            'longitude' => I('longitude'),
            'latitude' => I('latitude'),
            'logo' => $logo,
            'creatime' => date('Y-m-d H:i:s')
        );
    	if (empty($id)) {
            // var_dump($data);exit();
    		$hospital_table->add($data);
    		$this->success("添加成功！");
    	}else{
    		// var_dump($data);exit();
    		$hospital_table->where(array('id'=>$id))->save($data);
    		$this->success("修改成功！");
    	}
    }

    public function delete(){
		$id = I("id");
		if ($this->hospital_table->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
    }

    // 科室管理
    public function department(){
        $res = $this->department_table->order(array("hospitalid"=>"asc"))->select();
        
        $tree = new \Tree();
        $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $tree->nbsp = '&nbsp;&nbsp;&nbsp;';

        foreach ($res as $v) {
            $res_pub = $this->hospital_table->where(array('id'=>$v['hospitalid']))->field('id,name')->find();
            $v['hospitalid'] = $res_pub['name'];
            $v['str_manage'] = '<a href="'.U('Hospital/dpmedit',array('id'=>$v['id'])).'">'.L('EDIT').'</a> | <a class="js-ajax-delete" href="'.U('Hospital/dpmdelete',array('id'=>$v['id'])).'">'.L('DELETE').'</a> ';
            $array[] = $v;

        }
        $tree->init($array);

        $str = "<tr><td>\$spacer\$name</td><td>\$hospitalid</td><td>\$str_manage</td></tr>";
        $categorys = $tree->get_tree(0, $str);

        $this->assign("categorys", $categorys);
        // $this->assign();
        $this->display();
    }

    public function dpm(){
        $hospitalid = I('hospitalid');
        $terms = $this->department_table->where(array('parentid'=>0,'hospitalid'=>$hospitalid))->order(array("hospitalid"=>"asc"))->select();
        $this->ajaxReturn($terms);
    }

    public function dpmadd(){
        $res_hos = $this->hospital_table->field('id,name')->select();
        $this->assign('res_hos',$res_hos);
        $this->display();
    }

    public function dpmedit(){
        $id = I('id');
        $res_hos = $this->hospital_table->field('id,name')->select();
        $res = $this->department_table->where(array('id'=>$id))->find();
        $terms = $this->department_table->where(array('parentid'=>0,'hospitalid'=>$res['hospitalid']))->order(array("hospitalid"=>"asc"))->select();

        $this->assign('terms',$terms);
        $this->assign('res_hos',$res_hos);
        $this->assign('res',$res);
        $this->display();
    }

    public function dpmpost(){
        $id = I('id');
        $data = array(
            'hospitalid' => I('hospitalid'),
            'parentid' => I('parentid'),
            'name' => I('name')
        );
        if (empty($id)) {
            $this->department_table->add($data);
            $this->success("添加成功！");
        }else{
            $this->department_table->where(array('id'=>$id))->save($data);
            $this->success("修改成功！");
        }
    }

    public function dpmdelete(){
        $id = I("id");
        if ($this->department_table->where(array('id'=>$id))->delete() !==false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    // 病种管理
    public function diseases(){
        $res = $this->disease_table->select();
        foreach ($res as $k => & $v) {
           $res_dpma = $this->department_table->where(array('id'=>$v['pid']))->find();
           $res_dpmb = $this->department_table->where(array('id'=>$res_dpma['parentid']))->find();
           $res_dpmc = $this->hospital_table->where(array('id'=>$res_dpma['hospitalid']))->find();
           $v['dpmb'] = $res_dpmb['name'];
           $v['dpma'] = $res_dpma['name'];
           $v['dpmc'] = $res_dpmc['name'];
        }
        $this->assign('res',$res);
        $this->display();
    }

    public function diseadd(){
        $res_hos = $this->hospital_table->field('id,name')->select();
        $this->assign('res_hos',$res_hos);
        $this->display();
    }

    public function diseedit(){
        $id = I('id');
        $res = $this->disease_table->where(array('id'=>$id))->find();
        $res_dpm = $this->department_table->where(array('id'=>$res['pid']))->field('id,name,parentid,hospitalid')->order(array("hospitalid"=>"asc"))->find();
        $res_hos = $this->hospital_table->field('id,name')->select();

        $map['hospitalid'] = array('eq',$res_dpm['hospitalid']);
        // $map['parentid'] = array('neq',0);
        $map['parentid'] = array('eq',$res_dpm['parentid']);
        $mapks['hospitalid'] = array('eq',$res_dpm['hospitalid']);
        $mapks['parentid'] = array('eq',0);
        $res_dpmall = $this->department_table->where($map)->field('id,name')->select();

        $res_dpmks = $this->department_table->where($mapks)->field('id,name')->select();

        $this->assign('res',$res);
        $this->assign('res_dpm',$res_dpm);
        $this->assign('res_hos',$res_hos);
        $this->assign('res_dpmks',$res_dpmks);
        $this->assign('res_dpmall',$res_dpmall);
        $this->display();
    }

    public function dise(){
        $parentid = I('parentid');
        if ($parentid==0) {
            $terms = array('referer'=>0,'state'=>0);
            $this->ajaxReturn($terms);
        }
        $terms = $this->department_table->where(array('parentid'=>$parentid))->order(array("parentid"=>"asc"))->select();
        $this->ajaxReturn($terms);
    }

    public function disepost(){
        $id = I('id');
        $data = array(
            'name'=>I('name'),
            'pid'=>I('ppid')
            );
        if (empty($id)) {
            $this->disease_table->add($data);
            $this->success("添加成功！");
        }else{
            $this->disease_table->where(array('id'=>$id))->save($data);
            $this->success("修改成功！");
        }
    }

    public function disedelete(){
        $id = I("id");
        if ($this->disease_table->where(array('id'=>$id))->delete() !==false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    public function disname(){
        $ppid = I('ppid');
        $terms = $this->disease_table->where(array('pid'=>$ppid))->order(array("pid"=>"asc"))->select();
        $this->ajaxReturn($terms);
    }

}

