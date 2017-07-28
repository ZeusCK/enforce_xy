<?php
/**********************
 *部门
 **********************/
namespace Home\Model\Enforce;

class AreaDepModel extends CommonModel{
    protected $tableName = 'area_dep';
    public function get_val_item()
    {
        return $this->getField('areaid,areaname');
    }
}
