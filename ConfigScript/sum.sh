#! /bin/bash

git log --author="Jiajung" --since='2020-09-01' --until='2020-09-11' --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "增加的行数:%s 删除的行数:%s 总行数: %s\n",add,subs,loc }'


