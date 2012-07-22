---
layout: post
title: "Octopress 新浪微博侧边栏"
date: 2012-07-20 20:09
comments: true
categories: [ octopress, linux ]
---
首先到[微博秀](http://weibo.com/login.php?url=http%3A%2F%2Fweibo.com%2Ftool%2Fweiboshow)获取需要嵌入的code，例如

``` html
<iframe 
	width="100%" 
	height="550" 
	class="share_self"  
	frameborder="0" 
	scrolling="no" 
	src="http://widget.weibo.com/weiboshow/index.php?
        language=&width=0&height=550&
        fansRow=2&ptype=1&speed=0&
        skin=1&isTitle=1&noborder=1&
	isWeibo=1&isFans=1&uid=000000&verifier=00000&dpc=1">
</iframe>
```
其实就是各种参数，最后写成一个`weibo.html`,放到`.theme/<所用的主题名>/source/_includes/asides`，

{% gist 3151361 weibo.html %}

此外，还需要修改`_config.yml`

``` bash _config.yml
# 在 default_asides中添加asides/weibo.thml
default_asides: [asides/recent_posts.html, asides/weibo.html, asides/github.html, asides/Twitter.html, asides/googleplus.html]
weibo_uid: # 通过微博秀中获得
weibo_verifier: #微博秀中获得
weibo_fansline: 0   # 粉丝显示多少行
weibo_show: true    # 是否显示最近微博内容
weibo_pic: true     # 是否显示微博中的图片
weibo_skin: 10      # 使用哪种配色风格，数字为从1开始的微博秀风格序号
```

`weibo_uid`和`weibo_verifier`从微博秀中的代码中得到
<!-- more -->
