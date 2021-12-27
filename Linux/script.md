# shell脚本实战（Wicked Cool Shell Scripts，2nd Edition）

shell脚本就是包含一组可运行的特定的shell命令的文本文件，命令的执行顺序与其出现在脚本中的顺序一致。

## 设置开发目录
+ 在主目录下新建一个文件夹，命名为scriptx
```bash
mkdir Sriptx
```

+ 在登录脚本顶行添加开发目录的具体路径
```bash
export PATH="/home/xujunbi/scriptx:$PATH"
```
以后在scriptx目录下的shell脚本可以直接在bash行直接调用，记得修改权限。




