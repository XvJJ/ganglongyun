<?php
/**
 * 后台首页
 */
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class DomainController extends AdminbaseController
{

    protected $ip_table;
    protected $domain_table;

    public function _initialize()
    {
        $this->ip_table = M('ipadmin');
        $this->domain_table = M('domain');
        empty($_GET['upw']) ? "" : session("__SP_UPW__", $_GET['upw']); //设置后台登录加密码
        parent::_initialize();
        $this->initMenu();
    }

    // ip的站点个数
    public function domainTotal()
    {
        $domaintotal = array();
        $res = $this->ip_table->field('id,ip')->select();
        foreach ($res as $k => $v) {
            $dt = $this->domain_table->where(array('ipid' => $v['id']))->count();
            $domain_key = array('ip' => $v['ip'], 'total' => $dt);
            array_push($domaintotal, $domain_key);
        }
        // 二维数组以total字段排序
        array_multisort(array_column($domaintotal, 'total'), SORT_DESC, $domaintotal);
        var_dump($domaintotal);
    }

    public function ipindex()
    {
        $keyword = I('keyword');
        if ($keyword) {
            $where['ip'] = array('like', "%$keyword%");
            $this->assign('keyword', $keyword);
        }
        $count = $this->ip_table->where($where)->count();
        $page = $this->page($count, 20);
        $res = $this->ip_table->where($where)->order("id DESC")->limit($page->firstRow, $page->listRows)->select();

        $this->assign("page", $page->show('Admin'));
        $this->assign('res', $res);
        $this->display();
    }

    public function ipadd()
    {
        $this->display();
    }

    public function ipedit()
    {
        $id = I('id');
        $res = $this->ip_table->where(array('id' => $id))->find();
        $this->assign('res', $res);
        $this->display();
    }

    public function ippost()
    {
        $id = I('id');
        $ip = I('ip');
        $data = array(
            'ip' => $ip,
            'ipremark' => I('ipremark'),
        );
        if (empty($id)) {
            $isadd = $this->checkip($ip);
            if ($isadd == false) {
                $this->ip_table->add($data);
                $this->success("添加成功！");
            } else {
                $this->error("IP已存在！");
            }
        } else {
            $this->ip_table->where(array('id' => $id))->save($data);
            $this->success("修改成功！");
        }
    }

    public function ipdel()
    {
        $id = I('id');
        $isdel = $this->ip_table->where(array('id' => $id))->delete();
        if ($isdel !== false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    public function domainindex()
    {
        $ipid = I('ipid');
        $keyword = $this->IT('keyword');
        if ($ipid) {
            $where['ipid'] = $ipid;
            $this->assign('ipid', $ipid);
        }
        if ($keyword) {
            $where['domain'] = array('like', "%$keyword%");
            $this->assign('keyword', $keyword);
        }
        $ip_res = $this->ip_table->select();
        $count = $this->domain_table->where($where)->count();
        $page = $this->page($count, 20);
        $res = $this->domain_table->where($where)->order("id DESC")->limit($page->firstRow, $page->listRows)->select();

        foreach ($res as $k => &$v) {
            $ip = $this->ip_table->where(array('id' => $v['ipid']))->find();
            $v['ipid'] = $ip['ip'];
            if ($v['isspeed'] == 1) {
                $v['isspeed'] = '<span style="color:red">是</span>';
            } else {
                $v['isspeed'] = '否';
            }
        }
        $this->assign("page", $page->show('Admin'));
        $this->assign('ipres', $ip_res);
        $this->assign('res', $res);
        $this->display();
    }

    public function domainadd()
    {
        $res = $this->ip_table->select();
        $this->assign('res', $res);
        $this->display();
    }

    public function domainedit()
    {
        $id = I('id');
        $ip_res = $this->ip_table->select();
        $res = $this->domain_table->where(array('id' => $id))->find();
        $this->assign('ipres', $ip_res);
        $this->assign('res', $res);
        $this->display();
    }

    public function domainpost()
    {
        $id = I('id');
        $domain = I('domain');
        $data = array(
            'ipid' => I('ipid'),
            'domain' => $domain,
            'isspeed' => I('isspeed'),
            'remark' => I('remark'),
        );
        if (empty($id)) {
            $isadd = $this->checkdomain($domain);
            if ($isadd == false) {
                $this->domain_table->add($data);
                $this->success("添加成功！");
            } else {
                $this->error("域名已存在！");
            }
        } else {
            $this->domain_table->where(array('id' => $id))->save($data);
            $this->success("修改成功！");
        }
    }

    public function domaindel()
    {
        $id = I('id');
        $isdel = $this->domain_table->where(array('id' => $id))->delete();
        if ($isdel !== false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    public function checkip($ip)
    {
        $ip_res = $this->ip_table->field('ip')->select();
        $ip_arr = array();
        foreach ($ip_res as $k => $v) {
            array_push($ip_arr, $v['ip']);
        }
        if (in_array($ip, $ip_arr)) {
            return true;
        } else {
            return false;
        }
    }

    public function checkdomain($domain)
    {
        $domain_res = $this->domain_table->field('domain')->select();
        $domain_arr = array();
        foreach ($domain_res as $k => $v) {
            array_push($domain_arr, $v['domain']);
        }
        if (in_array($domain, $domain_arr)) {
            return true;
        } else {
            return false;
        }
    }
}
