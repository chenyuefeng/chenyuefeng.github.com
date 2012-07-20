---
layout: post
title: "Octopress 配置"
date: 2012-07-13 00:20
comments: true
categories: 
---

安装rvm,用rvm来安装 Ruby 1.9.2
``` bash
yum install rvm
```

安装 Ruby 1.9.2
``` bash
rvm install 1.9.2 && rvm use 1.9.2
```

安装 Octopress
``` bash
git clone git://github.com/imathis/octopress.git octopress
cd octopress
```

安装 bundler
``` bash
gem install bundler
bundle install
```

如果在安装 bundler 出现以下错误
``` bash
ERROR:  Loading command: install (LoadError)
    cannot load such file -- zlib
ERROR:  While executing gem ... (NameError)
    uninitialized constant Gem::Commands::InstallCommand
```

这是由于缺少zlib openssl 库的支持,安装zlib和openssl
``` bash
cd /usr/local/rvm/src/ruby-1.9.2-p320/ext/zlib
ruby ./extconf.rb
make
make install
cd /usr/local/rvm/src/ruby-1.9.2-p320/ext/openssl
ruby ./extconf.rb
make
make install
```

安装默认主题
``` bash
rake install
```

部署
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
