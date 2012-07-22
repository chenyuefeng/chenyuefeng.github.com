#!/bin/bash

phrase="5627024"
gitmessage=$1;
rake generate
./rakedeploy.sh
git add .
git commit -am "$1"
./gitpush.sh
