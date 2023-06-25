## 基础信息

https://account.bilibili.com/api/member/getCardByMid?mid=212535360

价值信息：

性别、年龄真实的参考性不大，只能读出如今世代的人们，不少对隐私方面还蛮重视的。

签名，从一定程度上，可以判定对B站平台定制化内容方面的参与度，爱好这方面的个性化。

文章数量，在该平台上的文字内容贡献。

```
name
sex
birthday
sign
article
```

标签设置的人相对小众，忽略。

https://api.bilibili.com/x/space/acc/tags?mid=1556651916

用户关注对象，ID转用户名

## 点赞

最近点赞的视频，从一定程度上可以反应其取向，但有时是流水刷的，或操作失误点的。外人访问一般是未公开了。

https://api.bilibili.com/x/space/like/video?vmid=212535360

判断方面，如果没有 tname、title 字段，直接置N/A 或 "用户隐私设置未公开"。

## 收藏与带货

整体看上去不是特别准。位置：https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/user/space.md

https://api.bilibili.com/x/v3/fav/folder/collected/list?up_mid=293793435&ps=20&pn=1

查看用户的发布课程：

https://api.bilibili.com/pugv/app/web/season/page?mid=33683045&ps=5&pn=1

https://api.bilibili.com/pugv/app/web/season/page?mid=298220126&ps=5&pn=1

## 警告信息与黑名单

用户的警告信息，搜索 notice 关键字：https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/user/info.md

调查用户的警告信息有风控，见：https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/misc/sign/wbi.md

黑名单

https://api.bilibili.com/x/credit/blocked/info?id=1556651916

```
curl -G 'https://api.bilibili.com/x/credit/blocked/info' \
--data-urlencode 'id=1091621'
```

出处：https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/blackroom/banlist.md

## 评论

热门评论API：https://api.bilibili.com/x/v2/reply/main?next=1&type=1&oid=402448083

评论点赞数：https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/comment/readme.md