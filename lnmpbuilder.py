#!/usr/bin python
# -*- coding: utf-8 -*-
import os
import sys


if os.getuid() == 0:
    pass
else:
    print('当前用户不是root用户，请以root用户执行脚本')
    sys.exit(1)
input('操作前请先看Readme，按任意键继续')
os.system('apt-get update')
os.system('apt-get install nginx -y')
os.system('service nginx start')
print('即将安装mysql，这个过程中会提示你设置密码，自己一定要记住密码')
input('中间会需要输入一次回车，不然不能继续，按任意键继续')
os.system('apt-get install mysql-server mysql-client -y')
os.system('rm -rf /etc/mysql/mysql.conf.d/mysqld.cnf')
os.system('cp mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf')
os.system('service mysql restart')
input('将进配置mysql远程访问，具体操作参考Readme，按任意键继续')
os.system('mysql -u root -p')
input('mysql已配置完毕可以通过navicat等工具测试链接，或者在自己本地mysql客户端中输入：mysql -h ip -u root -p;  ,按任意键继续')
os.system('apt install software-properties-common -y')
os.system('apt-get install python-software-properties -y')
input('将添加php7.0的源，下一步要求输入回车同意，按任意键继续')
os.system('apt-add-repository ppa:ondrej/php')
os.system('apt-get update')
os.system('apt install php7.0-fpm php7.0-mysql php7.0-curl -y')
os.system('mkdir -p /var/www')
os.system('rm -rf /etc/nginx/sites-available/default')
os.system('cp default  /etc/nginx/sites-available/default')
os.system('service nginx restart')
git = input('可选安装：git，安装请输入y:')
if git == 'y':
    os.system('apt install git -y')
fish = input('可选安装：fish，安装请输入y,修改为默认shell请输入yy(强烈建议):')
if fish == 'y'：
    os.system('apt install fish -y')
elif fish == 'yy':
    os.system('apt install fish -y')
    os.system('chsh -s /usr/bin/fish')
input('安装已结束,访问ip即可看到Nginx的欢迎页面，网站根目录在/var/www/html,按任意键退出脚本')
sys.exit(1)

