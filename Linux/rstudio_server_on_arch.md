# installation and usage of rstudio server on Archlinux



## installation

```
yay -S rstudio-server-bin
```



## installation verification of RStudio Server

```
sudo rstudio-server verify-installation
systemctl start rstudio-server.service
```



## modify the configuration file
```
vi /etc/rstudio/rserver.conf

www-port=yourport
```


## start RStudio Server

```
sudo systemctl start rstudio-server.service

sudo systemctl enable rstudio-server.service

```



