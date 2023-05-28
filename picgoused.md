## PicGo

**⚠️ 需注意：上传文件名重复的文件会有报错。**

picgo 有squoosh压缩图片神器批量压缩图片并上传，节约图床存储空间。而且删除本地相册文件不影响远程图床仓，方便查找预览以及快速浏览。


返回路径为

```
https://raw.githubusercontent.com/username/repo/main/dir/file.png
```

须要将链接批量转成cdn

https://raw.githubusercontent.com/hoochanlon/ihs-simple/main/AQUICK/taipei.png

## 批量转cdn链接（自定义域名即可）


将`https://raw.githubusercontent.com/`替换成 `https://cdn.jsdelivr.net/gh/`

例子

```
https://cdn.jsdelivr.net/gh/hoochanlon/ihs-simple
```

## 整合

picgo

![](https://cdn.jsdelivr.net/gh/hoochanlon/ihs-simple/AQUICK/true-picgo.png)

squoosh

![](https://cdn.jsdelivr.net/gh/hoochanlon/ihs-simple/AQUICK/squooshyes.png)

typora的设置

![](https://cdn.jsdelivr.net/gh/hoochanlon/ihs-simple/AQUICK/typora-set-ihs-pic.png)

一套操作下来，这样就可以复制粘贴到typora，picgo插件squoosh压缩图片，并上传到GitHub，用cdn返回链接了。nice。
