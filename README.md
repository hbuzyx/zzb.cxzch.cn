# zzb.cxzch.cn
程序安装说明：

1、新建一个数据库

2、打开/App/Common/Conf/db.php，修改成您自己数据库的用户名和密码。

3、导入根目录下的myhaochi.sql

4、如果是Linux系统必须把/App/Runtime、/App/Html、/uploads这三个目录和/page.config.php、/sitemap.xml、/sitemap_baidu.xml、/rss.xml的权限设置为777，否则无法使用！
5、后台登录地址：http://你的域名/code_admin.php

6、默认用户名和密码：admin 123456

THINKCMF-Nginx伪静态规则

location / {
    if (!-e $request_filename){
        rewrite  ^(.*)$  /index.php?s=$1  last;   break;
    }
}
  location ~ /.*\.php/ {
    rewrite ^(.*?/?)(.*\.php)(.*)$ /$2?s=$3 last;
    break;
  }