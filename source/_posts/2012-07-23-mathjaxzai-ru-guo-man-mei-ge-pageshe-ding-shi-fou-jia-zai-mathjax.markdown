---
layout: post
title: "Mathjax载入过慢，每个page设定是否加载Mathjax"
date: 2012-07-23 00:06
comments: true
categories: [ Octopress, linux ] 
---
前面文章中讲过如何在`octopress`中配置`latex`，但加入`latex`支持后打开网页的速度明显变慢，主要原因是国内[MathJax][1]的服务器经常被墙，导致加载每个`page`的速度非常慢。
针对上述问题，主要解决方法是每个`post`设定是否加载[MathJax][1],这样就会使得博客主页以及不需要加载[MathJax][1]的页面加载速度变快。下面介绍如何进行修改：
在需要加载[MathJax][1]的`post`中加入`latex: true`，如果不需要加载，就直接不用添加，如下所示

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

{% gist 3160266   .themes/<使用的主题名>/source/_includes/head.html %}

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

[1]:           http://www.mathjax.org/		"MathJax"
