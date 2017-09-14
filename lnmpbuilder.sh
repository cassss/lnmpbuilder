#!/bin/sh 
if [ `id -u` -ne 0 ];then  
    echo "此脚本需要root限权，请输入密码:";
    sudo "./$0";
else
    echo "操作前请先看Readme，按任意键继续"
    read anykey
    apt-get update
    apt-get install nginx -y
    service nginx start
    echo "即将安装mysql，这个过程中会提示你设置密码，自己一定要记住密码,按任意键继续"
    read anykey
    apt-get install mysql-server mysql-client -y
    rm -rf /etc/mysql/mysql.conf.d/mysqld.cnf
    cp mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
    service mysql restart
    echo "将进配置mysql远程访问,要求输入mysql密码,具体操作参考Readme，按任意键继续"
    read anykey
    mysql -u root -p
    echo "mysql已配置完毕可以通过navicat等工具测试链接,按任意键继续"
    read anykey
    apt install software-properties-common -y
    apt-get install python-software-properties -y
    echo "将添加php7.0的源，要求输入回车同意，按任意键继续"
    read anykey
    apt-add-repository ppa:ondrej/php
    apt-get update
    apt install php7.0-fpm php7.0-mysql php7.0-curl php7.0-xml php7.0-xmlrpc -y
    mkdir -p /var/www
    rm -rf /etc/nginx/sites-available/default
    echo "即将配置Nginx设置，若要部署laravel项目请输入y，其他则输入其他任意键"
    if [read laravel == "y" ]
    then
        cp laravel  /etc/nginx/sites-available/default
    else
        cp default  /etc/nginx/sites-available/default
    fi
    service nginx restart
    echo "可选安装以下软件应用:"
    select var in "git" "fish shell" "全部安装"; do 
        case $var in
        "git")
            apt install git -y
            break
            ;;
        "fish shell")
            apt install fish -y
            chsh -s /usr/bin/fish
            break
            ;;
        "全部安装")
            apt install git -y
            apt install fish -y
            chsh -s /usr/bin/fish
            break
            ;;
        *)
            echo "没有安装其他应用，即将进入下一步"
            break
            ;;
        esac
    done
    echo '安装已结束,访问ip即可看到Nginx的欢迎页面'
    echo '网站默认根目录:/var/www/html,laravel项目根目录为/var/www/laravel/public'
    echo '修改Nginx配置请输入:sudo vim /etc/nginx/sites-available/default'
    echo '按任意键退出脚本'
    read anykey        
fi