# beautifulsoup4基本操作

在解析html之前，我们需要创建一个Beautiful Soup对象。

```python
from bs4 import BeautifulSoup
import requests
target = 'http://www.biqukan.com/1_1094/5403177.html'
req = requests.get(url=target)
html = req.text
bf = BeautifulSoup(html)
# find_all方法的第一个参数是获取的标签名，第二个参数class_是标签的属性
texts = bf.find_all('div', class_ = 'showtxt') 
print(texts)

```











