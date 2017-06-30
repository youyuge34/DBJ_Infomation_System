#"coding=utf-8"
import tornado.httpserver
import tornado.web
import tornado.ioloop
import tornado.options
import os.path
from tornado.options import define, options
from condb import *
define("port", default=9000, type=int)

#基类
class BaseHandler(tornado.web.RequestHandler):
    def get_current_user(self):
        return self.get_secure_cookie("user")

#主页
class IndexHandler(BaseHandler):
    #@tornado.web.authenticated
    def get(self):
       flag=self.current_user
       re=displayMerchant()
       self.render('zero_point.html',f=flag,re=re)
    def post(self):
        user = self.get_argument('user')
        phone = self.get_argument('phone')
        pwd=self.get_argument('pwd')
        adr=self.get_argument('adr')

        f=adduser(user,phone,pwd,adr)
        if f==1:
            self.redirect('/login')
        else:
            self.render('reg.html',m='用户名被占用！')
#登陆功能

class LoginHandler(tornado.web.RequestHandler):
    def get(self):
        self.render('login.html')

    def post(self):
        name = self.get_argument('user1')
        pas = self.get_argument('pwd2')

        if(checkuser(name,pas)):
            self.set_secure_cookie('user', name)
        else:
            self.redirect('/login')

        self.redirect('/')


#用户注册功能
class RegistHandler(BaseHandler):
    def get(self):
        self.render('reg.html',m='')


#退出登陆
class LogoutHandler(tornado.web.RequestHandler):
    def get(self):
        self.clear_cookie('user')
        self.redirect('/')

#商家页面
class MerchantHandler(BaseHandler):
    def get(self,id):
        flag=self.current_user
        re=searchCommodity(id)
        name=searchMerchant(id)
        self.render('merchant.html',re=re,name=name,f=flag)

#将商品加入购物车
class SelectHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self,id):
        addMerchant(id)
        self.redirect(self.request.headers['referer'])

#购物车
class ShoppingHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self):
        re=displaymerchant(temp.templist)
        s=summ(temp.templist)
        self.render('shop.html',re=re,s=s)


#购物车删除操作
class ShopDeleteHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self,id):
        outtemp(id)
        self.redirect('/shopcart')

#提交订单
class PostMerchantHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self):
        user=self.get_current_user()
        consumer=getuserinfo(user)
        flag=postmerchant(consumer)
        if(flag==1):
            self.render('success.html')
        else:
            self.redirect('/shopcart')



#主运行
if __name__ == "__main__":
    settings = {
    "template_path": os.path.join(os.path.dirname(__file__), "templates"),
    "static_path": os.path.join(os.path.dirname(__file__), "static"),
    "cookie_secret": "pn6OqYE4RNi012c1pcF26gbDQTiEA07Ynniqz+TGyAw=",
    "xsrf_cookies": False,
    "login_url": "/login"
    }
    #路由表
    Handlers = [(r'/login', LoginHandler),
              (r'/', IndexHandler),
              (r'/regist',RegistHandler),
              (r'/logout',LogoutHandler),
              (r'/merchant/(\d+)',MerchantHandler),
                (r'/add/(\d+)',SelectHandler),
                (r'/shopcart',ShoppingHandler),
                (r'/outshop/(\d+)',ShopDeleteHandler),
                (r'/post',PostMerchantHandler)]
    tornado.options.parse_command_line()
    app = tornado.web.Application(handlers=Handlers, **settings )
    http_sever = tornado.httpserver.HTTPServer(app)
    http_sever.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()