---
layout: post
title: "Octopress Latex"
date: 2012-07-20 23:49
comments: true
categories: [ octopress, linux, latex ]
---
<!-- more -->
首先安装`kramdown`包

``` ruby
gem install kramdown
```
再把下面的代码添加到`.theme/<使用的主题名>/source/_includes/custom/head.html`文件中:

``` html 
<!-- mathjax config similar to math.stackexchange -->

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
修改`_config.yml`

``` ruby
markdown: kramdown  #rdiscount
```

## Attentation ##
使用`kramdown`时，对`markdown`的语法比`rdiscount`更加严格，例如<code>```lang</code>之前必须空行
以`##`为标题的之后不能有空行

## 右键点击页面消失 ##
``` diff fix for right-click
diff --git a/sass/base/_theme.scss b/sass/base/_theme.scss
index 9a50a8b..fc9dc37 100644
--- a/sass/base/_theme.scss
+++ b/sass/base/_theme.scss
@@ -75,7 +75,7 @@ html {
   background: $page-bg image-url('line-tile.png') top left;
 }
 body {
-  > div {
+  > div#main {
     background: $sidebar-bg $noise-bg;
     border-bottom: 1px solid $page-border-bottom;
     > div {

```
样例：

``` tex 
$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$
```
就会得到

$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$

``` tex
段内插入公式：$\exp(-\frac{x^2}{2})$
```
段内插入公式：$\exp(-\frac{x^2}{2})$
