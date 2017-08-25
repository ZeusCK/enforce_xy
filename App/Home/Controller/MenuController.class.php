<?php
namespace Home\Controller;

class MenuController extends CommonController
{
    protected $models = ['menu'=>'Enforce\Menu',
                         'role'=>'Enforce\Role'];

    public function index()
    {
        $this->display('menu');
    }
    public function datalist()
    {
        $this->ajaxReturn(g2us($this->getFunList()));
    }
    public function datalist2()
    {
        $db = D($this->models['menu']);
        $data = $db->select();
        $menu = $this->formatMenu(array(0),$data,$keepurl=true);
        $this->ajaxReturn(g2us($menu));
    }
    //获取登录用户的菜单展示
    public function get_fun_data()
    {
        $db = D($this->models['menu']);
        $menuData= session('menu');
        $where['id'] = array('in',explode(',', $menuData));
        $where['enable'] = 1;
        $data = $db->where($where)->order('ordernum desc')->select();
        $l_arr = ['id','pid'];
        $datac = $this->getParentData($data,$this->models['menu'],$l_arr);

        $data = array_merge($data,$datac);
        return $data;
    }
    /**
     * 获取菜单列表
     * @return array
     */
    public function getFunList()
    {
        $ids = array(0);
        $data = $this->get_fun_data();
        $menu = $this->formatMenu($ids,$data);
        return $menu;
    }

    public function dataAdd()
    {
        $request = I();
        $db = D($this->models['menu']);
        $result = $db->getTableAdd(u2gs($request));
        $roledb = D($this->models['role']);
        $roles = $roledb->select();
        foreach ($roles as $role) {
            $functionlist = explode(',',$role['functionlist']);
            if($role['level'] == 0){                //系统管理员进行无差别更新，可以更新根菜单
                 $functionlist[] = $result['add_id'];
                 $data['functionlist'] = implode(',',$functionlist);
                 $roledb->where('roleid='.$role['roleid'])->save($data);
            }else{
                if(in_array($request['pid'],$functionlist)){
                    $functionlist[] = $result['add_id'];
                    $data['functionlist'] = implode(',',$functionlist);
                    $roledb->where('roleid='.$role['roleid'])->save($data);
                }
            }
        }
        $this->ajaxReturn($result);
    }
    public function dataEdit()
    {
        $request = I();
        $db = D($this->models['menu']);
        $where['id'] = I('id');
        $result = $db->getTableEdit($where,u2gs($request));
        $this->ajaxReturn($result);
    }
    public function dataRemove()
    {
        
        $request = I('id');
        $db = D($this->models['menu']);
        $where['id'] = array('in',$request);
        $roledb = D($this->models['role']);
        $roles = $roledb->select();
        foreach ($roles as $role) {
            $functionlist = explode(',',$role['functionlist']);
            $remove = explode(',',$request);
            $fun = array_diff($functionlist,$remove);
            $data['functionlist'] = implode(',',$fun);
            $roledb->where('roleid='.$role['roleid'])->save($data);
        }
        $result = $db->getTableDel($where);
        $this->ajaxReturn($result);
    }

    public function indexMenuList()
    {
        $menus = $this->getUnflgParentMenu($menus);
    }
    /**
     * 格式化菜单
     * @param  array $ids   父级菜单id
     * @param  array $menus 修要处理的菜单
     * @return array        easyui的tree类型
     */
    public function formatMenu($ids,$menus,$keepurl)
    {
        $formatMenu = array();
        foreach ($ids as $id) {
            $odrMenu = array();
            foreach ($menus as $key=>$menu) {
                if($id == $menu['pid']){
                    $odrMenu[] = $menu['ordernum'];
                    $doMenu['ordernum'] = $menu['ordernum'];
                    $nextIds[] = $menu['id'];
                    $doMenu['id'] = $menu['id'];
                    $doMenu['text'] = $menu['name'];
                    $doMenu['iconCls'] = $menu['iconcls'];
                    if($menu['url']){
                        //判断是否为批处理文件 如果有的话 原样输出菜单  否则U方法输出菜单
                        if(strstr($menu['url'], '.bat') || $keepurl){
                            $attributes['url'] = $menu['url'];
                        }else{
                            $attributes['url'] = U($menu['url']);
                        }
                        $doMenu['attributes'] = $attributes;
                    }
                    //删除已经符合条件的数据减少下一次循环的次数
                    unset($menus[$key]);
                    $children = $this->formatMenu($nextIds,$menus,$keepurl);
                    $nextIds = '';
                    if(!empty($children)){
                        //$doMenu['state'] = 'closed';
                        $doMenu['children'] = $children;
                    }
                    $formatMenu[]=$doMenu;
                    //对于生成的菜单在进行排序
                    array_multisort($odrMenu,SORT_DESC,$formatMenu);
                    $doMenu = array();
                }
            }
        }
        return  $formatMenu;
    }
    /**
     * 获取未勾选的父级菜单数据
     * @param  array $menus 所有菜单
     * @return array  所有菜单及父级菜单 一维数组
     */
    public function getParentMenu($menus)
    {
        if(empty($menus)) return false;

        $datas = array();
        static $pids = array();
        foreach ($menus as $value) {
            $pids[] = $value['funid'];
        }
        foreach ($menus as $menu) {
            if(!in_array($menu['prefunid'],$pids)){
                $menuDb = D($this->models['menu']);
                $where['funid'] = $menu['prefunid'];
                $data = $menuDb->where($where)->find();
                if($data!=''  && !in_array($data['funid'],$pids)){
                    $datas[] = $data;
                }
                $pids[] = $menu['prefunid'];
            }
        }
        $datac = $this->getParentMenu($datas);
        if($datac){
            $datas = array_merge($datas,$datac);
        }
        return $datas;
    }
    //菜单展示
    public function all_menu_tree()
    {
        $menudb = D($this->models['menu']);
        $data = $menudb->select();
        $pid = array(0);
        $this->ajaxReturn(g2us($this->formatMenu($ids,$menus)));
    }
}