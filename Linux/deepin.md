# deepin系统终端命令
## 基本命令
您可以通过以下命令来查看系统的信息，其他系统相关命令操作可自行搜索查询。  
```
查看系统版本 cat /etc/deepin-version   
查看内核版本 uname -a 
查看软件源信息 cat /etc/apt/sources.list 
查看命令帮助 man chmod 或 chmod --help  
```


## Apt命令
您可以通过以下命令来查看、安装、卸载、清理、升级等信息。
```
更新包列表 sudo apt-get update
安装/升级所有可用更新 sudo apt-get dist-upgrade
安装应用程序更新 sudo apt-get upgrade
dselect安装更新 sudo apt-get dselect-upgrade
查找软件包 sudo apt-cache search package
显示包相关信息 sudo apt-cache show package
显示系统安装统计信息 sudo apt-cache stats
显示包的相关依赖 sudo apt-cache depends package
安装软件 sudo apt-get install package
重装软件 sudo apt-get install package --reinstall
强制安装软件 sudo apt-get -f install package
卸载软件 sudo apt-get remove package
卸载软件及配置 sudo apt-get remove package --purge
清理旧版本软件缓存 sudo apt-get autoclean
清理所有软件缓存 sudo apt-get clean
清理不再使用的孤立软件 sudo apt-get autoremove
删除更新和升级的缓存软件 cd /var/cache/apt/archives和sudo rm *.deb
```

## Deb命令
您可以通过以下命令来查看、安装、卸载、清理、升级等信息。
```
sudo dpkg -l 查看软件包的详细情况，iU表示未安装成功,ii表示安装成功。
sudo dpkg -s 查询已安装的deb包的信息。
sudo dpkg -L
package|more 查看软件包的安装情况。
sudo dpkg -S 查看软件属于哪个软件包。
sudo dpkg -i 安装deb包，部分存在depends关系，需要使用sudo apt-get -f
install来解决。
sudo dpkg -r 卸载指定的deb包，不删除软件包的配置文件。
sudo dpkg -P 卸载deb包同时也删除配置文件，部分存在depends关系，需要使用
sudo apt-get remove来解决。
```

## 关机和重启
```
在深度终端界面，还可以直接输入 sudo init 0 进行关机。
在深度终端界面，还可以直接输入 sudo reboot 进行重启。
```

## 系统安装及更新
```
sudo apt-get update  更新
sudo apt-get upgrade  更新
sudo apt-get dist-upgrade 更新
fc-cache -vf  安装字体
sudo nautilus /etc/apt/sources.list.d   显示部分安装的源，可以进行删除
```

## 软件安装（一些必要软件）
```
sudo apt-get install synaptic 安装新立得软件包管理器
sudo apt-get install deepin-appstore　安装深度软件商店
sudo apt-get install deepin-game-center　安装深度游戏中心
sudo apt autoremove  卸载无用的包
sudo apt-get clean  清理包
sudo apt install browser-plugin-freshplayer-pepperflash  安装flash
sudo update-pepperflashplugin-nonfree --install   更新flash
sudo apt-get install firefox-locale-zh-hans 火狐浏览器中文界面
sudo apt-get install thunderbird-locale-zh-hans  雷鸟邮件 中文界面
sudo rm /etc/apt/sources.list.d/maxthon-browser.list 删除遨游源
sudo apt-get install love-wallpaper  安装爱壁纸软件
sudo apt-get install dkms -y  安装dkms
sudo aptitude purge maxthon-browser-stable -y  卸载遨游软件
sudo install fcitx-table-wbpy  安装五笔拼音
```

## 优化处理
```
sudo os-prober 搜索其他系统
sudo update-grub 更新启动项设置
deepin-appstore -c 清除商店缓存
sudo nautilus /var/cache/apt/archives　优化下载软件
```
