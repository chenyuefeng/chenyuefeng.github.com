---
layout: post
title: "Octopress 增加Navibar"
date: 2012-07-20 20:29
comments: true
categories: [ octopress, linux ]
---
首先用`rake`来增加一个需要增加的页面，例如:

``` bash 
rake new_page[About]
```
这是会在`source/`目录先生产`about`目录以及`index.markdown`，如果这样直接`generate`，是不会把`about`页面增加到`navibar`中的，需要在`navigation.html`中进行设置，如果直接在`/source/_includes/custom/navigation.html`中修改，那么在切换主题时，改修改是不会保存的，需要再次修改，所以最好的方法是在主题文件中修改

{% codeblock lang:bash %}
.theme/classic/source/_includes/custom/navigation.html
{% endcodeblock %}
修改成

``` html navigation.html
<ul class="main-navigation">
  <li><a href="{{ root_url }}/">Blog</a></li>
  <li><a href="{{ root_url }}/blog/archives">Archives</a></li>
  <li><a href="{{ root_url }}/about">About</a></li>
</ul>
```
然后重新安装主题，

``` bash
rake install['theme name']
rake generate
rake deploy
```
<!-- more -->
