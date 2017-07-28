# 执法仪数据管理平台
## 前端 easyui 1.5
> 前端使用easyui框架写的App.js

增删改查，导出，表格

method:add_edit,remove,search,export && datagrid

如:
````
app.extra('add_edit',{});
app.datagrid(target,{});
````
> Tree.js

## 后端 thinkphp 3.2.3

> 重写权限筛选部分 根据部门ID+个人的警员编号进行筛选 减少sql语句长度，优化算法

部门联级查询建立缓存 减少大量的sql查询
````
Employee/get_manger_sql($areaid,$idFiled,$jybhFiled)
$areaid 部门ID
$idField 表中部门ID的字段
$jybhField 表中警员编号的的字段 为false时不管
````

> 修改````D()````使数据库模块化

```` $name = str_replace('\\','/',$name);````

> 统一前端请求接口 Ajax/index

tpUrl 请求 控制/方法  如 Case/case_list

reType 返回的格式 JSON,JSONP,XML,EVAL 默认JSON
    
后端方法统一问题，解决session锁问题

一律使用数组接受前端传值

使用return 返回结果