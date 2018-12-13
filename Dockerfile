FROM kubernetes-master:5000/library/centos:7.0

# 安装jdk,unzip
RUN yum makecache fast && yum install -y java-1.8.0-openjdk && yum install -y wget && yum install -y unzip && yum clean all

# 设置locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Shanghai

# 安装tomcat
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD ./tomcat8/tomcat-base-8.5.12.zip /opt/tomcat/
RUN unzip tomcat-base-8.5.12.zip
RUN chmod +x bin/*.sh

WORKDIR /opt/tomcat/webapps

# 拷贝程序包
ADD ./target/helloworld-2.1.1.RELEASE.war /opt/tomcat/webapps
RUN unzip -o -d /opt/tomcat/webapps/helloworld  helloworld-2.1.1.RELEASE.war && rm -rf helloworld-2.1.1.RELEASE.war

# 暴露8080端口
EXPOSE 8080

# 启动容器执行的命令
CMD bash /opt/tomcat/bin/catalina.sh run