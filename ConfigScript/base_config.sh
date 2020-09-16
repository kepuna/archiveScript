#! /bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

groupPath='./CreatePro'
group=""
prefix=""
confirmed="n"
year=`date +%Y` # ???


## -------- 函数 --------

getGroup() {
    echo "current group list:"
    ls ${groupPath} # 相当于终端查看ls groupPath路径下的有哪些文件
    echo -e "\n" # -e：激活转义字符 \n会按照换行输入,而不是字符串
    
    # 读取键盘的输入存入group变量
    read -p "Enter group:" group
    # -z :字符串的长度为零则为真
    if test -z "$group"; then
        getGroup
    fi
}

getPrefix() {
    read -p "Enter App Prefix:" prefix
    
    if test -z "$prefix"; then
        getPrefix
    fi
}

getInformation() {
    echo -e "\n"
    
    getGroup
    getPrefix
    
    echo -e "\n ${Default}================================================"
    
    echo -e "  group     :  ${Cyan}${group}${Default}"
    echo -e "  prefix    :  ${Cyan}${prefix}${Default}"
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
# 然后将输入的group文件夹名称和prefix文件夹
directory="${groupPath}/${group}/${prefix}"


baseModuleProtocolFilePath="${directory}/${prefix}BaseModuleProtocol.h"
baseModuleHeaderFilePath="${directory}/${prefix}BaseModule.h"
baseModuleImplementFilePath="${directory}/${prefix}BaseModule.m"

moduleContextHeaderFilePath="${directory}/${prefix}ModuleContext.h"
moduleContextImplementFilePath="${directory}/${prefix}ModuleContext.m"

modulesMapHeaderFilePath="${directory}/${prefix}ModulesMap.h"
modulesMapImplementFilePath="${directory}/${prefix}ModulesMap.m"

managerHeaderFilePath="${directory}/${prefix}RoomManager.h"
managerImplementFilePath="${directory}/${prefix}RoomManager.m"

requestProtocolFilePath="${directory}/${prefix}ReqeustModuleProtocol.h"
requestModuleHeaderFilePath="${directory}/${prefix}ReqeuestModule.h"
requestModuleImplementFilePath="${directory}/${prefix}ReqeuestModule.m"


roomVCHeaderFilePath="${directory}/${prefix}RoomViewController.h"
roomVCImplementFilePath="${directory}/${prefix}RoomViewController.m"


uiLayoutProtocolFilePath="${directory}/${prefix}UILayoutModuleProtocol.h"
uiLayoutModuleHeaderFilePath="${directory}/${prefix}UILayoutModule.h"
uiLayoutModuleImplementFilePath="${directory}/${prefix}UILayoutModule.m"


requestApiDefineFilePath="${directory}/${prefix}RequestApiDefine.h"
roomEventDefineFilePath="${directory}/${prefix}RoomEventDefine.h"
macroFilePath="${directory}/${prefix}Macro.h"
publicHeadersFilePath="${directory}/${prefix}PublicHeaders.h"


# 创建相关的文件夹📁
mkdir -p $directory

#拷贝文件
#将当前目录下templates文件夹下的 APIManagerTemplate.h 文件拷贝到 headerFilePath下
cp ./templates/XXXBaseModuleProtocol.h "$baseModuleProtocolFilePath"
cp ./templates/XXXBaseModule.h "$baseModuleHeaderFilePath"
cp ./templates/XXXBaseModule.m "$baseModuleImplementFilePath"

cp ./templates/XXXModuleContext.h "$moduleContextHeaderFilePath"
cp ./templates/XXXModuleContext.m "$moduleContextImplementFilePath"

cp ./templates/XXXModulesMap.h "$modulesMapHeaderFilePath"
cp ./templates/XXXModulesMap.m "$modulesMapImplementFilePath"

cp ./templates/XXXRoomManager.h "$managerHeaderFilePath"
cp ./templates/XXXRoomManager.m "$managerImplementFilePath"

cp ./templates/XXXReqeustModuleProtocol.h "$requestProtocolFilePath"
cp ./templates/XXXReqeuestModule.h "$requestModuleHeaderFilePath"
cp ./templates/XXXReqeuestModule.m "$requestModuleImplementFilePath"


cp ./templates/XXXUILayoutModuleProtocol.h "$uiLayoutProtocolFilePath"
cp ./templates/XXXUILayoutModule.h "$uiLayoutModuleHeaderFilePath"
cp ./templates/XXXUILayoutModule.m "$uiLayoutModuleImplementFilePath"


cp ./templates/XXXRoomViewController.h "$roomVCHeaderFilePath"
cp ./templates/XXXRoomViewController.m "$roomVCImplementFilePath"


cp ./templates/XXXPublicHeaders.h "$publicHeadersFilePath"
cp ./templates/XXXMacro.h "$macroFilePath"
cp ./templates/XXXRequestApiDefine.h "$requestApiDefineFilePath"
cp ./templates/XXXRoomEventDefine.h "$roomEventDefineFilePath"



# XXXBaseModuleProtocol.h
sed -i "" "s:__Prefix__:${prefix}:g" "$baseModuleProtocolFilePath"
sed -i "" "s:__year__:${year}:g"                    "$baseModuleProtocolFilePath"

# XXXBaseModule.h
sed -i "" "s:__Prefix__:${prefix}:g" "$baseModuleHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$baseModuleHeaderFilePath"

# XXXBaseModule.m
sed -i "" "s:__Prefix__:${prefix}:g" "$baseModuleImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$baseModuleImplementFilePath"

# XXXModuleContext.h
sed -i "" "s:__Prefix__:${prefix}:g" "$moduleContextHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$moduleContextHeaderFilePath"

# XXXModuleContext.m
sed -i "" "s:__Prefix__:${prefix}:g" "$moduleContextImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$moduleContextImplementFilePath"

# XXXModulesMap.h
sed -i "" "s:__Prefix__:${prefix}:g" "$modulesMapHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$modulesMapHeaderFilePath"

# XXXModulesMap.m
sed -i "" "s:__Prefix__:${prefix}:g" "$modulesMapImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$modulesMapImplementFilePath"

# XXXRoomManager.h
sed -i "" "s:__Prefix__:${prefix}:g" "$managerHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$managerHeaderFilePath"

# XXXRoomManager.m
sed -i "" "s:__Prefix__:${prefix}:g" "$managerImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$managerImplementFilePath"


# XXXReqeustModuleProtocol.h
sed -i "" "s:__Prefix__:${prefix}:g" "$requestProtocolFilePath"
sed -i "" "s:__year__:${year}:g"                    "$requestProtocolFilePath"

# XXXReqeuestModule.h
sed -i "" "s:__Prefix__:${prefix}:g" "$requestModuleHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$requestModuleHeaderFilePath"

# XXXReqeuestModule.m
sed -i "" "s:__Prefix__:${prefix}:g" "$requestModuleImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$requestModuleImplementFilePath"


# XXXRoomViewController.h
sed -i "" "s:__Prefix__:${prefix}:g" "$roomVCHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$roomVCHeaderFilePath"

# XXXRoomViewController.m
sed -i "" "s:__Prefix__:${prefix}:g" "$roomVCImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$roomVCImplementFilePath"


# XXXUILayoutModuleProtocol.h
sed -i "" "s:__Prefix__:${prefix}:g" "$uiLayoutProtocolFilePath"
sed -i "" "s:__year__:${year}:g"                    "$uiLayoutProtocolFilePath"

# XXXUILayoutModule.h
sed -i "" "s:__Prefix__:${prefix}:g" "$uiLayoutModuleHeaderFilePath"
sed -i "" "s:__year__:${year}:g"                    "$uiLayoutModuleHeaderFilePath"

# XXXUILayoutModule.m
sed -i "" "s:__Prefix__:${prefix}:g" "$uiLayoutModuleImplementFilePath"
sed -i "" "s:__year__:${year}:g"                    "$uiLayoutModuleImplementFilePath"

# XXXMacro.h
sed -i "" "s:__Prefix__:${prefix}:g" "$macroFilePath"
sed -i "" "s:__year__:${year}:g"                    "$macroFilePath"

# XXXPublicHeaders.h
sed -i "" "s:__Prefix__:${prefix}:g" "$publicHeadersFilePath"
sed -i "" "s:__year__:${year}:g"                    "$publicHeadersFilePath"

# XXXRequestApiDefine.h
sed -i "" "s:__Prefix__:${prefix}:g" "$requestApiDefineFilePath"
sed -i "" "s:__year__:${year}:g"                    "$requestApiDefineFilePath"

# XXXRoomEventDefine.h
sed -i "" "s:__Prefix__:${prefix}:g" "$roomEventDefineFilePath"
sed -i "" "s:__year__:${year}:g"                    "$roomEventDefineFilePath"


