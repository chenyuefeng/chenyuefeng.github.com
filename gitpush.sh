#!/usr/bin/expect 
set timeout 30
set mykeyphrase "5627024"
spawn /usr/bin/git push git@github.com:chenyuefeng/chenyuefeng.github.com.git HEAD:source
expect "Enter passphrase for key"
send "$mykeyphrase\n"
interact
