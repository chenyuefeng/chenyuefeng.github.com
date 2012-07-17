---
layout: post
title: "Octopress 配置"
date: 2012-07-13 00:20
comments: true
categories: 
---
``` bash 
git clone git@github.com:yourname/project.git
cd project
rake setup_github_pages
rake generate
rake deploy
git add .
git commit -am "   "
git push git@github.com:yourname/project.git HEAD:source
```
配置comments和社交网络工具

* 在_config.yml中增加一项: weibo_share: true
* 修改source/_includes/post/sharing.html，增加

``` bash
{%  if site.weibo_share %}
	{% include post/weibo.html %}
{% endif %}
```
* 增加文件: source/_includes/post/weibo.html
* 访问[http://www.jiathis.com/](http://www.jiathis.com/ "Jiathis")，复制code
* 访问[http://uyan.cc/](http://uyan.cc "uyan")复制code
* 将上面两个code复制到weibo.html中即可

<!-- 
``` bash install java http://java.com/ test
$ sudo yum install jave
```


``` cpp  install cpp http://java.com/ test
#include<iostream>
using namespace std;
int main()
{
	cin>>a;
	cout<<a;
}
```
-->
