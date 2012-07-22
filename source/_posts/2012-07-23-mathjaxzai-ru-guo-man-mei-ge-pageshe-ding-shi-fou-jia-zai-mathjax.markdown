---
layout: post
title: "Mathjax载入过慢，每个page设定是否加载Mathjax"
date: 2012-07-23 00:06
comments: true
categories: [ Octopress, linux ] 
---
前面文章中讲过如何在`octopress`中配置`latex`，但加入`latex`支持后打开网页的速度明显变慢，主要原因是国内[MathJax][]的服务器经常被墙，导致加载每个`page`的速度非常慢。
针对上述问题，主要解决方法是每个`post`设定是否加载[MathJax][],这样就会使得博客主页以及不需要加载[MathJax][]的页面加载速度变快。下面介绍如何进行修改：
在需要加载[MathJax][]的`post`中加入`latex: true`，如果不需要加载，就直接不用添加，如下所示

``` bash
layout: post
title: "Octopress Latex"
date: 2012-07-20 23:49
comments: true
latex: true
categories: [ octopress, linux, latex ]
```
修改主题，`.themes/<使用的主题名>/source/_includes/head.html`,在最后面加入`{% if page.latex == true %}{% include post/latex.html %} {% endif %}`
<!-- more -->

``` html    .themes/<使用的主题名>/source/_includes/head.html
<!DOCTYPE html>
<!--[if IEMobile 7 ]><html class="no-js iem7"><![endif]-->
<!--[if lt IE 9]><html class="no-js lte-ie8"><![endif]-->
<!--[if (gt IE 8)|(gt IEMobile 7)|!(IEMobile)|!(IE)]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>{% if page.title %}{{ page.title }} - {% endif %}{{ site.title }}</title>
  <meta name="author" content="{{ site.author }}">

  {% capture description %}{% if page.description %}{{ page.description }}{% else %}{{ content | raw_content }}{% endif %}{% endcapture %}
  <meta name="description" content="{{ description | strip_html | condense_spaces | truncate:150 }}">
  {% if page.keywords %}<meta name="keywords" content="{{ page.keywords }}">{% endif %}

  <!-- http://t.co/dKP3o1e -->
  <meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  {% capture canonical %}{{ site.url }}{% if site.permalink contains '.html' %}{{ page.url }}{% else %}{{ page.url | remove:'index.html' }}{% endif %}{% endcapture %}
  <link rel="canonical" href="{{ canonical }}">
  <link href="{{ root_url }}/favicon.png" rel="icon">
  <link href="{{ root_url }}/stylesheets/screen.css" media="screen, projection" rel="stylesheet" type="text/css">
  <script src="{{ root_url }}/javascripts/modernizr-2.0.js"></script>
  <script src="{{ root_url }}/javascripts/ender.js"></script>
  <script src="{{ root_url }}/javascripts/octopress.js" type="text/javascript"></script>
  <link href="{{ site.subscribe_rss }}" rel="alternate" title="{{site.title}}" type="application/atom+xml">
  {% include custom/head.html %}
  {% include google_analytics.html %}
  {% if page.latex == true %}{% include post/latex.html %} {% endif %}
</head>
```
最后在`.themes/<使用的主题名>/source/_includes/post/`下面创建`latex.html`

``` html .themes/<使用的主题名>/source/_includes/post/latex.html
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      processEscapes: true
    }
  });
</script>

<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
      }
    });
</script>

<script type="text/x-mathjax-config">
    MathJax.Hub.Queue(function() {
        var all = MathJax.Hub.getAllJax(), i;
        for(i=0; i < all.length; i += 1) {
            all[i].SourceElement().parentNode.className += ' has-jax';
        }
    });
</script>

<script type="text/javascript"
   src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
```
至此修改完成，只要重新安装主题，重新部署

``` bash
rake install["使用的主题名"]
rake generate
rake deploy
```





[MathJax]:http://www.mathjax.org/		"MathJax"

{% include links %}
