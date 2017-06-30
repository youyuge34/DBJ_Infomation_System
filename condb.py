#"coding=utf-8"
import time
import torndb
import temp
db = torndb.Connection(host = 'localhost',database ='course',user = 'root',password = 'qwert12345')

#Md5加密
def md5(str):
    import hashlib
    m = hashlib.md5()
    m.update(str)
    return m.hexdigest()

#获取当前系统时间
def GetNowTime():
    return time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(time.time()))
#注册功能数据库交互
def adduser(user,phone,pwd,address):
    password=md5(pwd)
    sql = "insert into userlist (user,phone,password,address) values ('%s','%s','%s','%s')" % (user,phone,password,address)
    sql2="select * from userlist where user='%s'"%(user)
    r=db.query(sql2)
    if(len(r)==0):
        db.execute(sql)
        flag=1
    else:
        flag=0
    return flag

#登陆功能数据库交互
def checkuser(username, pwd):
    password=md5(pwd)
    sql = "select * from userlist where user='%s' and password='%s'" % (username, password)
    result=db.query(sql)
    if(len(result) == 0):
        return False
    else:
        return True
#显示商家信息
def displayMerchant():
    sql="select * from merchant"
    result=db.query(sql)
    return result

#搜索指定商家名
def searchMerchant(id):
    sql='select * from merchant where id=%s'%(int(id))
    result=db.query(sql)
    return result
#搜索指定商家商品
def searchCommodity(id):
    sql='select * from commodity where merchant=%s'%(id)
    result=db.query(sql)
    return result

#添加购物车
def addMerchant(id):
    temp.templist.append(id)
#移除购物车
def outtemp(id):
    temp.templist.remove(id)

#计算商品总额
def summ(list):
    s=0
    for i in list:
        sql='select * from commodity where id=%s'%i
        re=db.query(sql)
        s+=re[0].price
    return s


#显示我的订单
def displaymerchant(llist):
    range='('
    for i in llist:
        range+=str(i)
        range+=','
    l=list(range)
    l[-1]=')'
    ran=''.join(l)
    sql="select * from commodity where id in %s"%ran
    res=db.query(sql)
    return res



#提交订单
def postmerchant(consumer):
    commodity=''
    for i in temp.templist:
        #拼接字符串
        t=str(i)
        t=t+'|'
        commodity+=t
        #更新商品被购买次数
        sql1='UPDATE course.commodity SET class=class+1 WHERE id=%s'%i
        db.execute(sql1)
    s=summ(temp.templist)
    #更新商家收入总额
    merchant=getmerchant(temp.templist[0])
    sql='UPDATE course.merchant SET income=income+%s WHERE id=%s'%(s,merchant[0].merchant)
    db.execute(sql)
    #更新用户消费
    sql3="UPDATE course.userlist SET cost=cost+%s WHERE id=%s"%(s,consumer[0].id)
    db.execute(sql3)
    #生成订单
    t=GetNowTime()
    sql2="INSERT INTO sellrecord  (consumer, commodity, money, time) VALUES ('%s', '%s', '%s', '%s')"%(consumer[0].id,commodity,s,t)
    db.execute(sql2)
    return 1


#获取指定用户信息:
def getuserinfo(name):
    sql="select * from userlist where user='%s'"%name
    re=db.query(sql)
    return re

#获取指定商品所属的商家
def getmerchant(id):
    sql='select * from commodity where id=%s'%id
    re=db.query(sql)
    return re
