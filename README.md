# lnmpbuilder-py3
## 本脚本仅为了快速部署lnmp环境,php版本为7.0<br>作者为py初学者，制作此脚本主要为了快速部署laravel项目
### 执行方法 将lnmpubuntu16.py传到ubuntu16的服务器上后在命令行输入：
	sudo python3 lnmpubuntu16.py
### 然后按脚本提示操作即可

## 提示：
###	1.vim的简单操作
        i 文本操作模式
        esc 退出文本操作模式到命令模式
####	命令模式下：
        dd     删除光标所在行
        /key   搜索key
        :wq    保存
        :wq!   强制保存
        :quit  退出
        :quit! 强制退出

## 注意事项：
###    1.环境要求：无lnmp环境的Ubuntu Server 16,Python3,root限权
###    2.关于进一步mysql远程访问：
		首先输入mysql密码
		use mysql;
		grant all privileges on *.* to root@"%" identified by "yourpassword" with grant option;
		flush privileges;
###    3.关于Nginx配置：
####		Nginx配置文件地址：/etc/nginx/sites-available/default,设置如下
		 server {
				    listen 80;
				    root /var/www/html;  #站点访问根目录
				    index index.php index.html index.htm index.nginx-debian.html;
				    server_name lnmpbuilder.com;    #将server_domain_or_IP修改为你的公网IP或者域名
				    #location / {
				    #   try_files $uri $uri/ /index.php?$query_string;
				    #   }    #开启路由访问,laravel项目必须去掉注释
					location ~ \.php$ {
					    try_files $uri /index.php =404;
					    fastcgi_split_path_info ^(.+\.php)(/.+)$;
					fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
					#确认php7.0-fpm.sock的位置,错误将无法正确识别php代码
					fastcgi_index index.php;
					fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
					include fastcgi_params;
				    }
				    location ~ /\.ht {
					    deny all;
				    }
			    }

###    5.php默认已安装的拓展：
		calendar,Core,ctype,curl,date,exif,fileinfo,filter,ftp,gettext,hash,iconv,json,libxml
		mysqli,mysqlnd,openssl,pcntl,pcre,PDO,pdo_mysql,Phar,posix,readline,Reflection,session
		shmop,sockets,SPL,standard,sysvmsg,sysvsem,sysvshm,tokenizer,Zend OPcache,zlib
###    6.php可选拓展：
		php7.0            php7.0-fpm        php7.0-mysql      php7.0-sqlite3
		php7.0-bcmath     php7.0-gd         php7.0-odbc       php7.0-sybase
		php7.0-bz2        php7.0-gmp        php7.0-opcache    php7.0-tidy
		php7.0-cgi        php7.0-imap       php7.0-pgsql      php7.0-xml
		php7.0-cli        php7.0-interbase  php7.0-phpdbg     php7.0-xmlrpc
		php7.0-common     php7.0-intl       php7.0-pspell     php7.0-xsl
		php7.0-curl       php7.0-json       php7.0-readline   php7.0-zip
		php7.0-dba        php7.0-ldap       php7.0-recode    
		php7.0-dev        php7.0-mbstring   php7.0-snmp      
		php7.0-enchant    php7.0-mcrypt     php7.0-soap
