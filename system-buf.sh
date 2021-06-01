

查看修改系统缓冲区：

      查看接收缓冲区：sudo sysctl -a | grep rmem

      修改配置文件：sudo vim /etc/sysctl.conf

      添加：
      net.core.rmem_max = 2097152
      net.core.wmem_max = 2097152


      执行配置：sudo sysctl -p
      
      
      
 C++ 查看修改socket缓冲区：
 https://blog.csdn.net/fuyuehua22/article/details/38232769
