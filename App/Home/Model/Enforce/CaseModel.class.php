<?php
/**********************
 *案件
 **********************/
namespace Home\Model\Enforce;
use Home\Model\Enforce\SyncCaseModel as SyncCase;

class CaseModel extends CommonModel{
    protected $tablePrefix = 'case_';

    public function sync($data,$op)
    {
        $syncTable = new SyncCase();
        $syncTable->sync($data,$op);
    }
}
