build

docker build -t redmine/svn ./

test 

docker run -it --rm  --privileged=true  -e "TZ=Asia/Shanghai" -p 7998:8000 -v /home/subversion/:/home/subversion/ redmine/svn bash

run

docker run -d --privileged=true --name redmine-svn --restart=always -e "TZ=Asia/Shanghai" -p 8000:8000 -v /home/subversion/:/home/subversion/ redmine/svn

-----

说明：

1、部署apache2+subversion的代码管理系统，而权限拦截沿用redmine上的用户验证方式，方便处理项目间的权限问题和修改密码也简单。

2、账号密码等配置见 subversion.conf 文件

3、Apache2 根目录 /etc/apache2/

4、由于本地业务需求，会映射的本地目录 /home/subversion/ ，因为在redmine上创建项目的时候会初始化目录，所以数据需要共享，暂时使用较为简单的本地共享方式。如果不需要redmine进行管理，可以自行处理。
