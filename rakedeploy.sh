#!/usr/bin/expect 
set timeout 30
set mykeyphrase "5627024"
spawn /usr/local/rvm/gems/ruby-1.9.2-p320/bin/rake deploy
expect "Enter passphrase for key"
send "$mykeyphrase\n"
interact
