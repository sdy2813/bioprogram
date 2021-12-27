# <p align='center'>新服务器必装依赖库</p>


如果一个新的ubuntu一定要安装一些库,反正做生物信息学数据分析，没有这些库，你总是会遇到各种各样的错误。

```bash
# added due to some issues during setup of the new HVM host
sudo apt-get autoclean
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install g++ pkg-config dh-autoreconf
sudo apt-get install libncurses5-dev
sudo apt-get install libgd2-xpm-dev
sudo apt-get install libboost-all-dev
sudo apt-get install libpstreams-dev
sudo apt-get install libglib2.0-dev
sudo apt-get install zlib1g-dev
# for the vcf-uploader
sudo apt-get install libxml-dom-perl libxml-xpath-perl libjson-perl libxml-libxml-perl time libdata-uuid-libuuid-perl libcarp-always-perl libipc-system-simple-perl libfile-tail-perl

```

---
参考：
[新的ubuntu一定要安装一些库 ](http://www.biotrainee.com/thread-2232-1-1.html)
