1） install mlnx_ofed driver for vma
download MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64 from  https://www.mellanox.com/products/infiniband-drivers/linux/mlnx_ofed
tar -xf MLNX...
cd MLNX...
sudo ./mlnxofedinstall --vma
sudo /etc/init.d/openibd restart
# 此时 libvma.so* 已被自动安装在 /usr/lib 中， 但这不是我们要用的。我们需要用的库是build from source
# 最好删掉 sudo rm /usr/lib/libvma*    否则会影响c++可执行程序运行时链接的libvma.so动态库


Prerequisites:
sudo apt install -y libnl-3-dev
sudo apt install -y libnl-route-3-dev
sudo vim /etc/security/limits.conf
#add line :  
#  * soft memlock unlimited
#  * hard memlock unlimited
relink ths ssh shell
#then use " ulimit -a " to check if it works


2)build libvma
git clone https://github.com/Mellanox/libvma
cd libvma
./autogen.sh
./configure --with-ofed=/usr --prefix=/usr --libdir=/usr/lib64 --includedir=/usr/include --docdir=/usr/share/doc/libvma --sysconfdir=/etc
make
You can find libvma.so in path_to_vma_source_dir/src/vma/.libs/libvma.so

3)usage
export LD_PRELOAD=/home/duanqingyang/libvma/src/vma/.libs/libvma.so
iperf .....
