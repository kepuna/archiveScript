#! /bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

groupPath='./CreatePro'
group=""
prefix=""
moduleName=""
confirmed="n"
isCreateUIView="y"
year=`date +%Y` # ???


## -------- 函数 --------

getGroup() {
    echo "current group list:"
    ls ${groupPath} # 相当于终端查看ls groupPath路径下的有哪些文件
    echo -e "\n" # -e：激活转义字符 \n会按照换行输入,而不是字符串
    
    # 读取键盘的输入存入group变量
    read -p "Enter Dir group:" group
    # -z :字符串的长度为零则为真
    if test -z "$group"; then
        getGroup
    fi
}

getPrefix() {
    read -p "Enter Prefix:" prefix
    
    if test -z "$prefix"; then
        getPrefix
    fi
}

getModuleName() {
    read -p "Enter Module Name:" moduleName
    
    if test -z "$moduleName"; then
        getModuleName
    fi
}

getUIView() {
    read -p "是否生成Module相关的UIView视图? (y/n):" isCreateUIView
}

getInformation() {
    echo -e "\n"

    # Enter Group
    getGroup
    
    getPrefix
    
    # Enter Module Name
    getModuleName
    
    getUIView
    
    echo -e "\n ${Default}================================================"
    
    echo -e "  group     :  ${Cyan}${group}${Default}"
    echo -e "  prefix    :  ${Cyan}${prefix}${Default}"
    echo -e "  module    :  ${Cyan}${prefix}${moduleName}Module${Default}"
    echo -e "  module    :  ${Cyan}${prefix}${moduleName}View${Default}"
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
# 然后将输入的group文件夹名称和moduleName文件夹
directory="${groupPath}/${group}/${moduleName}"

moduleProtocolFilePath="${directory}/${prefix}${moduleName}ModuleProtocol.h"
moduleHeaderFilePath="${directory}/${prefix}${moduleName}Module.h"
moduleImplementFilePath="${directory}/${prefix}${moduleName}Module.m"

viewHeaderFilePath="${directory}/${prefix}${moduleName}View.h"
viewImplementFilePath="${directory}/${prefix}${moduleName}View.m"


# 创建相关的文件夹📁
mkdir -p $directory

#拷贝文件
#将当前目录下templates文件夹下的 APIManagerTemplate.h 文件拷贝到 headerFilePath下
cp ./templates/ModuleProtocolTemplate.h "$moduleProtocolFilePath"
cp ./templates/ModuleTemplate.h "$moduleHeaderFilePath"
cp ./templates/ModuleTemplate.m "$moduleImplementFilePath"

cp ./templates/UIViewTemplate.h "$viewHeaderFilePath"
cp ./templates/UIViewTemplate.m "$viewImplementFilePath"


# ModuleProtocol.h
sed -i "" "s:__Prefix__:${prefix}${moduleName}:g" "$moduleProtocolFilePath"
sed -i "" "s:__PrefixApp__:${prefix}:g" "$moduleProtocolFilePath"
sed -i "" "s:__year__:${year}:g"                    "$moduleProtocolFilePath"

# Module.h
sed -i "" "s:__Prefix__:${prefix}${moduleName}:g" "$moduleHeaderFilePath"
sed -i "" "s:__PrefixApp__:${prefix}:g" "$moduleHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$moduleHeaderFilePath"

# Module.m
sed -i "" "s:__Prefix__:${prefix}${moduleName}:g" "$moduleImplementFilePath"
sed -i "" "s:__PrefixApp__:${prefix}:g" "$moduleImplementFilePath"
sed -i "" "s:__year__:${year}:g"   "$moduleImplementFilePath"



# View.h
sed -i "" "s:__PrefixViewName__:${prefix}${moduleName}:g" "$viewHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$viewHeaderFilePath"

# View.m
sed -i "" "s:__PrefixViewName__:${prefix}${moduleName}:g" "$viewImplementFilePath"
sed -i "" "s:__year__:${year}:g"   "$viewImplementFilePath"


