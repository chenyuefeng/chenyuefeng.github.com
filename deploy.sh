#!/usr/bin/expect 
set timeout 10
set mykeyphrase "5627024"
set gitmessage [lrange $argv 1 1]
spawn /usr/local/rvm/gems/ruby-1.9.2-p320/bin/rake generate 
spawn /usr/local/rvm/gems/ruby-1.9.2-p320/bin/rake deploy
expect "Enter passphrase for key"
send "$mykeyphrase\n" 

spawn git add .
spawn git commit -am "$gitmessage"
spawn git push git@github.com:chenyuefeng/chenyuefeng.github.com.git HEAD:source
expect "Enter passphrase for key"
send "$mykeyphrase\n"
interact 
