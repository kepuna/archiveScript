#! /bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

groupPath='./CreatePro'
group=""
fileName=""
methodName=""
confirmed="n"
year=`date +%Y` # ???

cachePolicy=""
cachePolicyList=("ZZAPIPlicyNoCache" "ZZAPIPlicyMemory" "ZZAPIPlicyDisk" "ZZAPIPlicyMemory | ZZAPIPlicyDisk")

## -------- 函数 --------

getGroup() {
    echo "current group list:"
    ls ${groupPath} # 相当于终端查看ls groupPath路径下的有哪些文件
    echo -e "\n" # -e：激活转义字符 \n会按照换行输入,而不是字符串
    
    # 读取键盘的输入存入group变量
    read -p "Enter API group:" group
    # -z :字符串的长度为零则为真
    if test -z "$group"; then
        getGroup
    fi
}

getAPIName() {
    read -p "Enter API fileName:" fileName
    
    if test -z "$fileName"; then
        getAPIName
    fi
}

getMethodName() {
    read -p "Enter API method name:" methodName
    
    if test -z "$methodName"; then
        getMethodName
    fi
}

getCachePolicy() {
    echo -e "\n"
    # 获取数组的长度: 获取数组长度的方法与获取字符串长度的方法相同
    length=${#cachePolicyList[@]} # ????
    
    # 遍历数组
    for ((index=0; index<length; index++)); do
    echo "111"
        echo " (${index}) ${cachePolicyList[$index]}"
    done
    
    read -p "Select API cache policy (enter the index) :" cachePolicyIndex
    # -lt 小于则为真
    # $变量名 和 ${变量名} 的区别 ??
    if test $cachePolicyIndex -lt $length; then
        cachePolicy=${cachePolicyList[${cachePolicyIndex}]}
    else
        echo -e "\n\n the index must less than ${length}\n"
        getCachePolicy
    fi
}

getInformation() {
    echo -e "\n"
    getMethodName
    echo -e "\n"
    
     # Linux grep 命令用于查找文件里符合条件的字符串。 grep test *file  在当前目录中查找后缀有 file 字样的文件中包含 test 字符串的文件，并打印出该字符串的行.
    
    # -r 或 --recursive : 此参数的效果和指定"-d recurse"参数相同。
    # -H 或 --with-filename : 在显示符合样式的那一行之前，表示该行所属的文件名称。
    # -n 或 --line-number : 在显示符合样式的那一行之前，标示出该行的列数编号。
    grep -rHn $methodName ${groupPath} && echo -e "\n${Cyan}I have found same API manager${Default}" && exit 0
    
    # Enter Group
    getGroup
    
    # Enter API Name
    getAPIName
    getCachePolicy
    
    echo -e "\n ${Default}================================================"
    
    echo -e "  group       :  ${Cyan}${group}${Default}"
    echo -e "  fileName    :  ${Cyan}${fileName}${Default}"
    echo -e "  methodName  :  ${Cyan}${methodName}${Default}"
    echo -e "  cachePolicy :  ${Cyan}${cachePolicy}${Default}"
    echo -e "================================================\n"
    
    
}

# Start here
# -a,-o,!等同于&&,||,! ======>与，或，非
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInformation
    fi
    read -p "confirm? (y/n):" confirmed
done

# 在事先定义好的 groupPath文件夹
# 然后将输入的group文件夹名称和fileName文件夹
directory="${groupPath}/${group}/${fileName}"
headerFilePath="${directory}/${fileName}.h"
implementFilePath="${directory}/${fileName}.m"

# 创建相关的文件夹📁
mkdir -p $directory

#拷贝文件
#将当前目录下templates文件夹下的 APIManagerTemplate.h 文件拷贝到 headerFilePath下
cp ./templates/APIManagerTemplate.h "$headerFilePath"
cp ./templates/APIManagerTemplate.m "$implementFilePath"

# 接着通过SED命令编辑.h和.m文件, 主要对文件进行搜索替换操作
# -i 原地编辑（⚠️修改源文件)
# s: 查找替换
# sed -i "" 表示对源文件什么也不做
# 全局搜索 headerFilePath 下的文件中搜索 __APIManagerFileName__ 然后替换成 输入的fileName
sed -i "" "s:__APIManagerFileName__:${fileName}:g" "$headerFilePath"
sed -i "" "s:__year__:${year}:g"                    "$headerFilePath"
#sed -i "" "s:__year__:${year}:g"                    "$implementFilePath"


