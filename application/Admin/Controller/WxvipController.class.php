<?php
/**
 * 后台首页
 */
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class WxvipController extends AdminbaseController {
	
	public function _initialize() {
	    empty($_GET['upw'])?"":session("__SP_UPW__",$_GET['upw']);//设置后台登录加密码	    
		parent::_initialize();
		$this->initMenu();
	}

    /**
     * 微信会员卡管理
     */
    public function index() {
    	$res = M('wxvipcard')->field('id,title,publicid,isopen,cardid,vipstate')->select();
        foreach ($res as $k => & $v) {
            if ($v['isopen']==0) {
                $v['cardid'] = '还未开卡';
            }           
        }
    	$this->assign('res',$res);
       	$this->display();
    }

    public function add(){
    	$res_pub = M('wxconfig')->field('id,name')->select();
        $this->assign('res_pub',$res_pub);
    	$this->display();
    }

    public function edit(){
    	$id = I('id');

    	$res_pub = M('wxconfig')->field('id,name')->select();
        $res = M('wxvipcard')->where(array('id'=>$id))->find();
        $new_bs = explode(',',$res['business_service']);
        $this->assign('new_bs',$new_bs);
        $this->assign('res_pub',$res_pub);
    	$this->assign('res',$res);
    	$this->display();
    }

    public function post(){
    	$wxvip_table = M('wxvipcard');
    	$id = I('id');
        $image_url = $_POST['smeta']['thumb'];
        $business_service1 = I('business_service1');
        $business_service2 = I('business_service2');
        $business_service3 = I('business_service3');
        $business_service4 = I('business_service4');
        $business_service = $business_service1.','.$business_service2.','.$business_service3.','.$business_service4;
        $cost_money_unit = I('cost_money_unit');
        $max_increase_bonus = I('max_increase_bonus');
        $init_increase_bonus = I('init_increase_bonus');
        $increase_bonus = I('increase_bonus');
        $cost_bonus_unit = I('cost_bonus_unit');
        $reduce_money = I('reduce_money');
        $least_money_to_use_bonus = I('least_money_to_use_bonus');
        $max_reduce_bonus = I('max_reduce_bonus');
    	if (empty($id)) {
    		$data = array (
                'publicid' => I('publicid'),
                'card_type' => 'MEMBER_CARD',
                'background_pic_url' => I('background_pic_url'),
                'wx_activate' => true,
                'logo_url' => I('logo_url'),
                'brand_name' => I('brand_name'),
                'code_type' => 'CODE_TYPE_QRCODE',
                'title' => I('title'),
                'color' => I('color'),
                'notice' => '使用时请出示此卡',
                'service_phone' => I('service_phone'),
                'description' => I('description'),
                'type' => 'DATE_TYPE_PERMANENT',
                'quantity' => I('quantity'),
                'membership_number' => I('membership_number'),
                'get_limit' => I('get_limit'),
                'use_custom_code' => true,
                'can_give_friend' => false,
                'promotion_url_name' => I('promotion_url_name'),
                'promotion_url' => I('promotion_url'),
                'need_push_on_view' => false,
                'image_url' => $image_url,
                'text' => I('text'),
                'business_service' => $business_service,
                'type' => 'MONDAY',
                'begin_hour' => '0',
                'end_hour' => '10',
                'begin_minute' => '10',
                'end_minute' => '59',
                'type' => 'HOLIDAY',
                'supply_bonus' => true,
                'supply_balance' => true,
                'prerogative' => I('prerogative'),
                'auto_activate' => false,
                'name_type' => 'FIELD_NAME_TYPE_LEVEL',
                'name_type_url' => I('name_type_url'),
                'cost_money_unit' => $cost_money_unit,
                'increase_bonus' => $increase_bonus,
                'max_increase_bonus' => $max_increase_bonus,
                'init_increase_bonus' => $init_increase_bonus,
                'cost_bonus_unit' => $cost_bonus_unit,
                'reduce_money' => $reduce_money,
                'least_money_to_use_bonus' => $least_money_to_use_bonus,
                'max_reduce_bonus' => $max_reduce_bonus,
                'discount' => I('discount')
            );
            // var_dump($data['business_service']);exit();
    		$wxvip_table->add($data);
    		$this->success("添加成功！");
    	}else{
    		$data = array (
                'publicid' => I('publicid'),
                'card_type' => 'MEMBER_CARD',
                'background_pic_url' => I('background_pic_url'),
                'wx_activate' => true,
                'logo_url' => I('logo_url'),
                'brand_name' => I('brand_name'),
                'code_type' => 'CODE_TYPE_QRCODE',
                'title' => I('title'),
                'color' => I('color'),
                'notice' => '使用时请出示此卡',
                'service_phone' => I('service_phone'),
                'description' => I('description'),
                'type' => 'DATE_TYPE_PERMANENT',
                'quantity' => I('quantity'),
                'membership_number' => I('membership_number'),
                'get_limit' => I('get_limit'),
                'use_custom_code' => true,
                'can_give_friend' => false,
                'promotion_url_name' => I('promotion_url_name'),
                'promotion_url' => I('promotion_url'),
                'need_push_on_view' => false,
                'image_url' => $image_url,
                'text' => I('text'),
                'business_service' => $business_service,
                'type' => 'MONDAY',
                'begin_hour' => '0',
                'end_hour' => '10',
                'begin_minute' => '10',
                'end_minute' => '59',
                'type' => 'HOLIDAY',
                'supply_bonus' => true,
                'supply_balance' => true,
                'prerogative' => I('prerogative'),
                'auto_activate' => false,
                'name_type' => 'FIELD_NAME_TYPE_LEVEL',
                'name_type_url' => I('name_type_url'),
                'cost_money_unit' => $cost_money_unit,
                'increase_bonus' => $increase_bonus,
                'max_increase_bonus' => $max_increase_bonus,
                'init_increase_bonus' => $init_increase_bonus,
                'cost_bonus_unit' => $cost_bonus_unit,
                'reduce_money' => $reduce_money,
                'least_money_to_use_bonus' => $least_money_to_use_bonus,
                'max_reduce_bonus' => $max_reduce_bonus,
                'discount' => I('discount')
            );
            // var_dump($data['business_service']);exit();
    		$wxvip_table->where(array('id'=>$id))->save($data);
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
    	$res = M('wxmenu')->select();
    	$res_conf = M('wxconfig')->field('id,name')->select();
    	foreach ($res as $k => & $v) {
    		$res_pub = M('wxconfig')->where(array('id'=>$v['publicid']))->field('id,name')->find();
    		$v['publicid'] = $res_pub['name'];
    		if ($v['parentid']!=0) {
    			$v['name'] = '&nbsp;&nbsp;&nbsp;∟'.$v['name'];
    		}
    	}
    	$this->assign('res_conf',$res_conf);
    	$this->assign('res',$res);
    	$this->display();
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

    public function delivery(){
        $id = I('id');
        $this->assign('id',$id);
        $this->display();
    }
    // 会员中心管理
    public function vipcenter(){
        $config_table = M('wxconfig');
        $wxvipcard_table = M('wxvipcard');
        $publicid = I('publicid');
        $isjihuo = I('isjihuo');
        if (!empty($publicid)) {
            $map['publicid'] = $publicid;
            $this->assign('publicid',$publicid);
        }
        if ($isjihuo!='') {
            $map['isjihuo'] = $isjihuo;
            $this->assign('isjihuo',$isjihuo);
        }
        $res_pub = $config_table->field('id,name')->select();
        $this->assign('res_pub',$res_pub);

        $res = M('vipdetail')->where($map)->select();
        foreach ($res as $k => & $v) {
            $res_title = $wxvipcard_table->where(array('cardid'=>$v['cardid']))->field('title')->find();
            $v['title'] = $res_title['title'];
            if ($v['isjihuo']==1) {
                $v['isjihuo'] = '是';
            }else{
                $v['isjihuo'] = '<span style="color:red;">否</span>';
            }
        }
        $this->assign('res',$res);
        $this->display();
    }
}

