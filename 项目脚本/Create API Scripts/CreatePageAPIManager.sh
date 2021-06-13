#!/bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

groupPath="../APITemplateProject_OC/APITemplateProject_OC/APIManagers"
group=""
fileName=""
methodName=""
confirmed="n"
year=`date +%Y`

# serviceIdentifier=""
# serviceIdentifierList=("kCTServiceBLHTTPSService" "kCTServiceBLOpenAPIService")

cachePolicy=""
cachePolicyList=("CTAPIManagerCachePolicyNoCache" "CTAPIManagerCachePolicyMemory" "CTAPIManagerCachePolicyDisk" "CTAPIManagerCachePolicyMemory | CTAPIManagerCachePolicyDisk")

requestType="CTAPIManagerRequestTypeGet"
# requestTypeList=("CTAPIManagerRequestTypePost")

getGroup() {
    echo "current group list:"
    ls ${groupPath}
    echo -e "\n"
    read -p "Enter API group: " group

    if test -z "$group"; then
        getGroup
    fi
}

getAPIName() {
    read -p "Enter API fileName: " fileName

    if test -z "$fileName"; then
        getAPIName
    fi
}

getMethodName() {
    read -p "Enter API method name: " methodName

    if test -z "$methodName"; then
        getMethodName
    fi
}

getServiceIdentifier() {
    echo -e "\n"
    length=${#serviceTypeList[@]}
    for ((index=0; index<length; index++)); do
        echo "  (${index}) ${serviceTypeList[$index]}"
    done

    read -p "Enter API service type (enter the index) :" serviceTypeIndex

    if test $serviceTypeIndex -lt $length; then
        serviceIdentifier=${serviceTypeList[${serviceTypeIndex}]}
    else
        echo -e "\n\n the index must less than ${length}\n"
        getServiceIdentifier
    fi
}

getCachePolicy() {
    echo -e "\n"
    length=${#cachePolicyList[@]}
    for ((index=0; index<length; index++)); do
        echo "  (${index}) ${cachePolicyList[$index]}"
    done

    read -p "Select API cache policy (enter the index) :" cachePolicyIndex

    if test $cachePolicyIndex -lt $length; then
        cachePolicy=${cachePolicyList[${cachePolicyIndex}]}
    else
        echo -e "\n\n the index must less than ${length}\n"
        getCachePolicy
    fi
}

getRequestType() {
    echo -e "\n"
    length=${#requestTypeList[@]}
    for ((index=0; index<length; index++)); do
        echo "  (${index}) ${requestTypeList[$index]}"
    done

    read -p "Select API request type (enter the index) :" requestTypeIndex

    if test $requestTypeIndex -lt $length; then
        requestType=${requestTypeList[${requestTypeIndex}]}
    else
        echo -e "\n\n the index must less than ${length}\n"
        getRequestType
    fi
}

getInfomation() {
	echo -e "\n"
    getMethodName
	echo -e "\n"
    grep -rHn $methodName ${groupPath} && echo -e "\n${Cyan}I have found same API manager${Default}" && exit 0
    getGroup
    getAPIName
    # getServiceIdentifier
    getCachePolicy
    # getRequestType

    echo -e "\n${Default}================================================"
    echo -e "  group       :  ${Cyan}${group}${Default}"
    echo -e "  fileName    :  ${Cyan}${fileName}${Default}"
    echo -e "  methodName  :  ${Cyan}${methodName}${Default}"
    # echo -e "  serviceIdentifier :  ${Cyan}${serviceIdentifier}${Default}"
    echo -e "  cachePolicy :  ${Cyan}${cachePolicy}${Default}"
    # echo -e "  requestType :  ${Cyan}${requestType}${Default}"
    echo -e "================================================\n"
}

# start here
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done

directory="${groupPath}/${group}/${fileName}"
headerFilePath="${directory}/${fileName}.h"
implementFilePath="${directory}/${fileName}.m"

mkdir -p $directory
cp ./templates/PageAPIManagerTemplate.h "$headerFilePath"
cp ./templates/PageAPIManagerTemplate.m "$implementFilePath"

sed -i "" "s:__APIManagerFileName__:${fileName}:g"  "$headerFilePath"
sed -i "" "s:__year__:${year}:g"                    "$headerFilePath"

sed -i "" "s:__year__:${year}:g"                    "$implementFilePath"
sed -i "" "s:__APIManagerFileName__:${fileName}:g"  "$implementFilePath"
sed -i "" "s:__MethodName__:${methodName}:g"        "$implementFilePath"
# sed -i "" "s:__ServiceType__:${serviceIdentifier}:g"      "$implementFilePath"
sed -i "" "s:__CachePolicy__:${cachePolicy}:g"      "$implementFilePath"
sed -i "" "s:__RequestType__:${requestType}:g"      "$implementFilePath"
