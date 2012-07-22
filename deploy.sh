#!/usr/bin/expect 
set timeout -1
set mykeyphrase "5627024"
set gitmessage [lrange $argv 1 1]
spawn /usr/local/rvm/gems/ruby-1.9.2-p320/bin/rake generate 
expect "OK?"

spawn /usr/local/rvm/gems/ruby-1.9.2-p320/bin/rake deploy
expect "Enter passphrase for key"
send "$mykeyphrase\n" 

spawn git add .
expect "OK ?"
spawn git commit -am "$gitmessage"
expect "OK?"
spawn /usr/bin/git push git@github.com:chenyuefeng/chenyuefeng.github.com.git HEAD:source
expect "Enter passphrase for key"
send "$mykeyphrase\n"
interact 
