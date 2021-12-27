# request库基本操作

网络爬虫的第一步就是根据URL，获取网页的HTML信息。在Python3中，可以使用urllib.request和requests进行网页爬取。

+ urllib库是python内置的，无需我们额外安装，只要安装了Python就可以使用这个库。
+ requests库是第三方库，需要我们自己安装。

基本操作函数  
![](https://atts.w3cschool.cn/attachments/image/20180517/1526540611518773.jpg)  
常用的也就是get

比如
```python
import requests
r = requests.get('https://api.github.com/events')
r.text
```








