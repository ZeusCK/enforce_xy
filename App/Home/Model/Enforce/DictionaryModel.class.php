<?php
/**********************
 *字典
 **********************/
namespace Home\Model\Enforce;

class DictionaryModel extends CommonModel{
    protected $tableName = 'dictionary';
    public function get_val_item($type = '')
    {
        if($type == '') return array();
        $where['type'] = $type;
        $where['item'] = array('NEQ','');
        return $this->where($where)->order('`order` asc')->getField('value,item');
    }
}
