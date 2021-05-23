1） install mlnx_ofed driver for vma
download MLNX_OFED_LINUX-4.9-3.1.5.0-ubuntu18.04-x86_64 from  https://www.mellanox.com/products/infiniband-drivers/linux/mlnx_ofed
tar -xf MLNX...
cd MLNX...
sudo ./mlnxofedinstall --vma
sudo /etc/init.d/openibd restart
# 此时 libvma.so* 已被安装在 /usr/lib 中， 但这不是我们要用的



2)build libvma
git clone https://github.com/Mellanox/libvma
cd libvma
./autogen.sh
./configure --with-ofed=/usr --prefix=/usr --libdir=/usr/lib64 --includedir=/usr/include --docdir=/usr/share/doc/libvma --sysconfdir=/etc
make
You can find libvma.so in path_to_vma_source_dir/src/vma/.libs/libvma.so

3)usage
export LD_PRELOAD=path_to_libvma.so
iperf .....
