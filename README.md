# lnmpbuilder
## 本脚本仅为了快速部署lnmp环境,php版本为7.0<br>,制作此脚本主要为了快速部署laravel项目
### 执行方法将本项目上传到ubuntu16的服务器上后进入项目根目录在命令行输入：
#### 使用sh脚本:
	sudo chmod +x ./lnmpbuilder.sh
	sudo ./lnmpbuilder.sh
#### 或使用python3脚本
	sudo python3 lnmpbuilder.py
### 然后按脚本提示操作即可

## 注意事项：
###		1.环境要求：无lnmp环境的Ubuntu Server 16,Python3,root
###		2.关于配置mysql远程访问：
		首先输入mysql密码
		use mysql;
		grant all privileges on *.* to root@"%" identified by "yourpassword" with grant option;
		flush privileges;
		exit
###		3.关于Nginx配置：
####		Nginx配置文件地址：/etc/nginx/sites-available/default,设置如下
		 server {
				    listen 80;
				    root /var/www/html;  #站点访问根目录
				    index index.php index.html index.htm index.nginx-debian.html;
				    server_name lnmp.com;    #将server_domain_or_IP修改为你的公网IP或者域名
				    location / {
						try_files $uri $uri/ =404；
				       # try_files $uri $uri/ /index.php?$query_string;
					   #上行设置为开启路由访问,laravel项目需要改为上行设置
				       }    
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
		shmop,sockets,SPL,standard,sysvmsg,sysvsem,sysvshm,tokenizer,Zend OPcache,zlib,xml
		xmlreader,xmlrpc,xmlwriter

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
