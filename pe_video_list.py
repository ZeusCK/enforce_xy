# -*- coding: utf-8 -*-
import pymysql,datetime,random,time
class PeData:
    def __init__(self,host,user,passwd,db,charset):
        self.host = host
        self.db = pymysql.connect(host=host,
                                  user=user,
                                  passwd=passwd,
                                  db=db,
                                  charset=charset)
        self.cursor = self.db.cursor()
    def get_one_emp_area(self):
        sql = """
        SELECT e.code,name,e.areacode,areaname
        FROM employee as e ,area_dep as a
        WHERE a.areacode=e.areacode
        """
         # 执行sql语句
        try:
           # 执行sql语句
           self.cursor.execute(sql)
           result = self.cursor.fetchall()
           result = random.choice(result)
           print(result)
           return result[0],result[1],result[2],result[3]
        except:
           # 如果发生错误则回滚
           print('获取警员信息发生错误')
           return False

    def get_one_ws(self):
        sql='select gzz_ip from ws_base'
        try:
           # 执行sql语句
           self.cursor.execute(sql)
           result = self.cursor.fetchall()
           info = random.choice(result)
           return info[0]
        except:
           # 如果发生错误则回滚
           print('获取工作站信息发生错误')
           return False
    def creatPeVideoInfo(self):
        code,name,areacode,areaname = self.get_one_emp_area()
        tempeTime = time.time()-24*60*60
        tempbTime = time.time()-7*24*60*60
        start_time = random.randrange(int(tempbTime),int(tempeTime))
        insertList = {}
        end_time = start_time+random.randrange(15*69,30*60)
        insertList['case_key'] = time.strftime('%Y%m%d%H%M%S',time.gmtime(start_time))+'_'+code+'_'+areacode
        insertList['start_time'] = time.strftime('%Y-%m-%d %H:%M:%S',time.gmtime(start_time))
        insertList['title'] = insertList['start_time']+ ' '+name+' data';
        insertList['end_time'] = time.strftime('%Y-%m-%d %H:%M:%S',time.gmtime(end_time))
        insertList['jybh'] = code
        insertList['jyxm'] = name
        insertList['areacode'] = areacode
        insertList['areaname'] = areaname
        return insertList
    def insertInfo(self,table,data):
        sql = 'insert into '+table
        fields = []
        info = []
        for x in data:
            fields.append(x)
            info.append("'"+str(data[x])+"'")
        values = ','.join(fields)
        values = '('+values+')'
        datas  = ','.join(info)
        sql = sql + values + 'VALUES ('+datas+')'
        print(sql)
        try:
           # 执行sql语句
           self.cursor.execute(sql)
           self.db.commit()
           print('插入成功')
        except:
           # 如果发生错误则回滚
           self.db.rollback()
           print('插入失败')
           return False
    def getLastInsertId(self):
        sql = 'select last_insert_id()'
        return self.cursor.execute(sql)

    def start(self):
        pe_video_info = self.creatPeVideoInfo()
        table_time = time.mktime(time.strptime(pe_video_info['start_time'], "%Y-%m-%d %H:%M:%S"))
        case_table = 'case_'+time.strftime('%Y%m',time.gmtime(table_time))
        self.insertInfo(case_table,pe_video_info)
        for x in range(3,6):
            pe_video_lsit_info = self.creatPeVideoListInfo(pe_video_info)
            video_time = time.mktime(time.strptime(pe_video_lsit_info['start_time'], "%Y-%m-%d %H:%M:%S"))
            case_video_table = 'case_video_'+time.strftime('%Y%m',time.gmtime(video_time))
            self.insertInfo(case_video_table,pe_video_lsit_info)
    def creatPeVideoListInfo(self,pe_video_info):
        start_time = time.mktime(time.strptime(pe_video_info['start_time'], "%Y-%m-%d %H:%M:%S"))
        wjlx = random.randrange(0,4)
        insertList = {}
        if wjlx == 1:
            wjcd = random.randrange(2*60,5*60+1)
            end_time = start_time+wjcd
            #视频结束时间
            insertList['end_time'] = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(end_time))
            #视频时长
            insertList['wjcd'] = wjcd
        temp = start_time+random.randrange(16*60*60,18*60*60)
        scsj = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(temp))
        tempst = time.strftime('%Y%m%d', time.gmtime(start_time))
        tempst2 = time.strftime('%Y%m%d%H%M%S', time.gmtime(start_time))
        wjbh = '@'+tempst2+str(random.randrange(60*60,18*60*60))
        ccwz = 'file/'+str(start_time)+'/'+wjbh
        bfwz = 'http://'+self.host+'/'+ccwz
        start_time = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(start_time))
        upload = random.randrange(0,2)
        insertList['case_key'] = pe_video_info['case_key']
        insertList['jybh'] = pe_video_info['jybh']   #警员编号
        insertList['jyxm'] = pe_video_info['jyxm']   #警员姓名
        insertList['areacode'] = pe_video_info['areacode']   #部门ID
        insertList['areaname'] = pe_video_info['areaname']   #部门名称
        #insertList['gzzbh'] = gzzbh    #工作站编号
        #insertList['gzz_ip'] = gzz_ip #工作站IP
        insertList['wjbh'] = wjbh    #文件编号
        insertList['start_time'] = start_time  #开始时间
        insertList['wjlx'] = wjlx   #文件类型
        insertList['ccwz'] = ccwz   #存储位置
        insertList['bfwz'] = bfwz   #播放位置
        insertList['scsj'] = scsj   #上传时间
        insertList['upload'] = upload  #上传级别
        #print(insertList)
        return insertList
    def insert_pe_video_list(self):
        sql = 'insert into pe_video_list'
        data = self.getInsertInfo()
        fields = []
        info = []
        for x in data:
            fields.append(x)
            info.append("'"+str(data[x])+"'")
        values = ','.join(fields)
        values = '('+values+')'
        datas  = ','.join(info)
        sql = sql + values + 'VALUES ('+datas+')'
        try:
           # 执行sql语句
           self.cursor.execute(sql)
           self.db.commit()
           print('插入成功')
        except:
           #  如果发生错误则回滚
           self.db.rollback()
           print('获取工作站信息发生错误')
           return False
    def db_close(self):
        self.db.close()
if __name__ == '__main__':
    pe_data = PeData('localhost','root','123456','enforce_xz','latin1')
    start = time.time()
    i = 0
    while time.time() - start < 3*60 :
        pe_data.start()
        time.sleep(random.randrange(1,4))
        i = i+1
    pe_data.db_close()
    print('3分钟'+str(i)+'条数据插入完毕')