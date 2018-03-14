<?php
/**
 * 后台首页
 */
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class WechatController extends AdminbaseController {
	
	public function _initialize() {
	    empty($_GET['upw'])?"":session("__SP_UPW__",$_GET['upw']);//设置后台登录加密码	    
		parent::_initialize();
		$this->initMenu();
	}

    /**
     * 微信管理
     */
    public function index() {
    	$res = M('wxconfig')->select();
    	$this->assign('res',$res);
       	$this->display();
    }

    public function add(){
    	$url = 'http://'.$_SERVER['HTTP_HOST'].'/index.php?g=Portal&m=Wechat&a=index&accountid=';
    	$this->assign('url',$url);
    	$this->display();
    }

    public function edit(){
    	$id = I('id');
    	$res = M('wxconfig')->where(array('id'=>$id))->find();
    	$this->assign('icon',$res['icon']);
    	$this->assign('res',$res);
    	$this->display();
    }

    public function post(){
    	$wxconfig_table = M('wxconfig');
    	$id = I('id');
    	$icon = $_POST['smeta']['thumb'];
    	if (empty($id)) {
    		$data = array(
    			'name' => I('name'),
    			'appid' => I('appid'),
    			'appsecret' => I('appsecret'),
    			'encodingaeskey' => I('encodingaeskey'),
    			'token' => I('token'),
    			'url' => I('url'),
    			'icon' => $icon,
    			'hftext' => I('hftext'),
    			'creatime' => date('Y-m-d H:i:s')
    			);
    		$wxconfig_table->add($data);
    		$this->success("添加成功！");
    		// var_dump($data);exit();
    	}else{
    		$data = array(
    			'name' => I('name'),
    			'appid' => I('appid'),
    			'appsecret' => I('appsecret'),
    			'encodingaeskey' => I('encodingaeskey'),
    			'token' => I('token'),
    			'url' => I('url'),
    			'icon' => $icon,
    			'hftext' => I('hftext'),
    			'creatime' => date('Y-m-d H:i:s')
    			);
    		// var_dump($data);exit();
    		$wxconfig_table->where(array('id'=>$id))->save($data);
    		$this->success("修改成功！");
    	}
    }

    public function delete(){
		$id = I("id");
		if (M('wxconfig')->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
    }

    /**
    *微信自定义菜单
    */
    public function wxmenu(){
        $res = M('wxmenu')->order(array("publicid"=>"asc"))->select();
        
        $tree = new \Tree();
        $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $tree->nbsp = '&nbsp;&nbsp;&nbsp;';

    	$res_conf = M('wxconfig')->field('id,name')->select();
    	foreach ($res as $v) {
    		$res_pub = M('wxconfig')->where(array('id'=>$v['publicid']))->field('id,name')->find();
    		$v['publicid'] = $res_pub['name'];
            $v['str_manage'] = '<a href="'.U('Wechat/wxmenuedit',array('id'=>$v['id'])).'">'.L('EDIT').'</a> | <a class="js-ajax-delete" href="'.U('Wechat/wxmenudelete',array('id'=>$v['id'])).'">'.L('DELETE').'</a> ';
            $array[] = $v;

    	}
        $tree->init($array);

        $str = "<tr><td>\$spacer\$name</td><td>\$type</td><td>\$publicid</td><td>\$str_manage</td></tr>";
        $categorys = $tree->get_tree(0, $str);

        $this->assign("categorys", $categorys);
    	$this->assign('res_conf',$res_conf);
    	// $this->assign('res',$res);
    	$this->display();
    }

    public function wxmenuadd(){
    	$res_pub = M('wxconfig')->field('id,name')->select();
        $this->assign('res_pub',$res_pub);
    	$this->display();
    }

    public function wxpubmenu(){
        $publicid = I('publicid');
        $terms = M('wxmenu')->where(array('parentid'=>0,'publicid'=>$publicid))->order(array("publicid"=>"asc"))->select();
        $this->ajaxReturn($terms);

    }

    public function wxmenuedit(){
        $table_wxmenu = M('wxmenu');
    	$id = I('id');
        $res_pub = M('wxconfig')->field('id,name')->select();
    	$res = $table_wxmenu->where(array('id'=>$id))->find();
        $terms = $table_wxmenu->where(array('parentid'=>0,'publicid'=>$res['publicid']))->order(array("publicid"=>"asc"))->select();

        $this->assign('terms',$terms);
    	$this->assign('res_pub',$res_pub);
    	$this->assign('res',$res);
    	$this->display();
    }

    public function wxmenupost(){
    	$wxmenu_table = M('wxmenu');
    	$id = I('id');
    	if (empty($id)) {
    		$data = array(
    			'type' => I('type'),
    			'name' => I('name'),
    			'key' => I('key'),
    			'url' => I('url'),
    			'listorder' => I('listorder'),
    			'status' => I('status'),
    			'parentid' => I('parentid'),
    			'publicid' => I('publicid')
    			);
            var_dump($data);exit();
    		$wxmenu_table->add($data);
    		$this->success("添加成功！");
    	}else{
    		$data = array(
    			'type' => I('type'),
    			'name' => I('name'),
    			'key' => I('key'),
    			'url' => I('url'),
    			'listorder' => I('listorder'),
    			'status' => I('status'),
    			'parentid' => I('parentid'),
    			'publicid' => I('publicid')
    			);
    		$wxmenu_table->where(array('id'=>$id))->save($data);
    		$this->success("修改成功！");
    	}
    }

    public function wxmenudelete(){
    	$id = I("id");
		if (M('wxmenu')->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
    }

    // 粉丝管理
    public function fensi(){
    	$config_table = M('wxconfig');
    	$publicid = I('publicid');
    	if (!empty($publicid)) {
    		$map['publicid'] = $publicid;
    		$this->assign('publicid',$publicid);
    	}
    	$res_pub = $config_table->field('id,name')->select();
    	$this->assign('res_pub',$res_pub);
    	$res = M('wxuser')->where($map)->select();
    	foreach ($res as $k => & $v) {
    		if ($v['sex']==1) {
    			$v['sex'] = '男';
    		}elseif($v['sex']==2){
    			$v['sex'] = '女';
    		}else{
    			$v['sex'] = '未知';
    		}
    		if ($v['isguanzhu']==1) {
    			$v['isguanzhu'] = '<span style="color:green;">已关注</span>';
    		}elseif($v['isguanzhu']==0){
    			$v['isguanzhu'] = '<span style="color:red;">已取消关注</span>';
    		}else{
    			$v['isguanzhu'] = '未关注';
    		}
    		$res_pubName = $config_table->where(array('id'=>$v['publicid']))->field('name')->find();
    		$v['publicid'] = $res_pubName['name'];
    	}
    	$this->assign('res',$res);
    	$this->display();
    }
    // 扫码权限
    public function scanCode(){
    	$fensi_table = M('wxuser');
    	$id = I('id');
    	$scan = I('scan');
    	
    	$data['id'] = $id;
    	if ($scan==1) {
    		$data['isscan'] = 0;
    		$fensi_table->where(array('id'=>$id))->save($data);
    		$this->ajaxReturn($data);
    	}else{
    		$data['isscan'] = 1;
    		$fensi_table->where(array('id'=>$id))->save($data);
    		$this->ajaxReturn($data);
    	}
    }
    // 关键字文本回复
    public function hfmessage(){
    	$config_table = M('wxconfig');
    	$publicid = I('publicid');
    	if (!empty($publicid)) {
    		$map['publicid'] = $publicid;
    		$this->assign('publicid',$publicid);
    	}
    	$res_pub = $config_table->field('id,name')->select();
    	$res = M('wxmessage')->where($map)->select();
    	foreach ($res as $k => & $v) {
    		$res_pubName = $config_table->where(array('id'=>$v['publicid']))->field('name')->find();
    		$v['publicid'] = $res_pubName['name'];
    	}
    	$this->assign('res_pub',$res_pub);
    	$this->assign('res',$res);
    	$this->display();
    }
    public function messageadd(){
    	$res_pub = M('wxconfig')->field('id,name')->select();
    	$this->assign('res_pub',$res_pub);
    	$this->display();
    }
    public function messagedit(){
    	$id = I('id');

    	$res_pub = M('wxconfig')->field('id,name')->select();
    	$this->assign('res_pub',$res_pub);
    	$res = M('wxmessage')->where(array('id'=>$id))->find();
    	// var_dump($res);exit();
    	$this->assign('res',$res);
    	$this->display();
    }
    public function wxmessagepost(){
    	$wxmessage_table = M('wxmessage');
    	$id = I('id');
    	if (empty($id)) {
    		$data = array(
    			'keywords' => I('keywords'),
    			'content' => I('content'),
    			'publicid' => I('publicid')
    			);
    		$wxmessage_table->add($data);
    		$this->success("添加成功！");
    	}else{
    		$data = array(
    			'keywords' => I('keywords'),
    			'content' => I('content'),
    			'publicid' => I('publicid')
    			);
    		$wxmessage_table->where(array('id'=>$id))->save($data);
    		$this->success("修改成功！");
    	}
    }
    public function messagedelete(){
    	$id = I("id");
		if (M('wxmessage')->where(array('id'=>$id))->delete() !==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
    }
}

