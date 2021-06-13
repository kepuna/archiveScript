#!/bin/bash

cd ..

Cyan='\033[0;36m'
Default='\033[0;m'

projectName=""
httpsRepo=""
sshRepo=""
homePage=""
serviceName=""
year=`date +%Y`

confirmed="n"

getServiceName() {
    read -p "Enter Service Name: " serviceName

    if test -z "$serviceName"; then
        getServiceName
    fi
}

getProjectName() {
    read -p "Enter Project Name: " projectName

    if test -z "$projectName"; then
        getProjectName
    fi
}

getHTTPSRepo() {
    read -p "Enter HTTPS Repo URL: " httpsRepo

    if test -z "$httpsRepo"; then
        getHTTPSRepo
    fi
}

getSSHRepo() {
    read -p "Enter SSH Repo URL: " sshRepo

    if test -z "$sshRepo"; then
        getSSHRepo
    fi
}

getHomePage() {
    read -p "Enter Home Page URL: " homePage

    if test -z "$homePage"; then
        getHomePage
    fi
}

getInfomation() {
    getProjectName
    getHTTPSRepo
    getSSHRepo
    getHomePage
    getServiceName

    echo -e "\n${Default}================================================"
    echo -e "  Project Name  :  ${Cyan}${projectName}${Default}"
    echo -e "  HTTPS Repo    :  ${Cyan}${httpsRepo}${Default}"
    echo -e "  SSH Repo      :  ${Cyan}${sshRepo}${Default}"
    echo -e "  Home Page URL :  ${Cyan}${homePage}${Default}"
    echo -e "  Service Name  :  ${Cyan}${serviceName}${Default}"
    echo -e "================================================\n"
}

echo -e "\n"
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done

git clone https://github.com/casatwy/APITemplateProject.git ${projectName}

gitignoreFilePath="./${projectName}/.gitignore"
specFilePath="./${projectName}/${projectName}.podspec"
readmeFilePath="./${projectName}/readme.md"
uploadFilePath="./${projectName}/upload.sh"
podfilePath="./${projectName}/Podfile"

ViewControllerPath="./${projectName}/${projectName}/Demo/ViewController/ViewController.swift"
EventResponseViewControllerPath="./${projectName}/${projectName}/Demo/ViewController/EventResponse.ViewController.extension.swift"
LifeCycleViewControllerPath="./${projectName}/${projectName}/Demo/ViewController/LifeCycle.ViewController.extension.swift"
UITableViewControllerPath="./${projectName}/${projectName}/Demo/ViewController/UITableView.ViewController.extension.swift"
ServiceFilePath="./${projectName}/${projectName}/$projectName/Service/${serviceName}.swift"

TemplateCreateAPIManagerPath="./${projectName}/Scripts/CreateAPIManager.sh"
TemplateCreatePageAPIManagerPath="./${projectName}/Scripts/CreatePageAPIManager.sh"
TemplateCreateServicePath="./${projectName}/Scripts/CreateService.sh"
TemplateAPIViewControllerPath="./${projectName}/Scripts/templates/APIViewController.swift"
TemplateServicePath="./${projectName}/Scripts/templates/Service.swift"
TemplateAPIManagerPath="./${projectName}/Scripts/templates/APIManager.swift"
TemplatePageAPIManagerPath="./${projectName}/Scripts/templates/PagableAPIManager.swift"

mv ./${projectName}/pod.podspec  "$specFilePath"
mv ./${projectName}/APITemplateProject ./${projectName}/${projectName}
mv ./${projectName}/${projectName}/APITemplateProject ./${projectName}/${projectName}/${projectName}
mv ./${projectName}/APITemplateProject.xcodeproj ./${projectName}/${projectName}.xcodeproj
mv ./${projectName}/${projectName}/$projectName/Service/__ServiceName__.swift $ServiceFilePath
mkdir -p ./${projectName}/${projectName}/$projectName/Groups

sed -i "" "s%__ProjectName__%${projectName}%g" "$readmeFilePath"
sed -i "" "s%APITemplateProject%${projectName}%g" "$readmeFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$gitignoreFilePath"
sed -i "" "s%APITemplateProject%${projectName}%g" "$gitignoreFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$uploadFilePath"
sed -i "" "s%APITemplateProject%${projectName}%g" "$uploadFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$specFilePath"
sed -i "" "s%__HomePage__%${homePage}%g"      "$specFilePath"
sed -i "" "s%__HTTPSRepo__%${httpsRepo}%g"    "$specFilePath"
sed -i "" "s%APITemplateProject%${projectName}%g" "$specFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$podfilePath"
sed -i "" "s%APITemplateProject%${projectName}%g" "$podfilePath"
  
sed -i "" "s%APITemplateProject%${projectName}%g" "./${projectName}/${projectName}.xcodeproj/project.pbxproj"
sed -i "" "s%__ServiceName__%${serviceName}%g" "./${projectName}/${projectName}.xcodeproj/project.pbxproj"

sed -i "" "s%APITemplateProject%${projectName}%g" "./${projectName}/${projectName}.xcodeproj/project.xcworkspace/contents.xcworkspacedata"

sed -i "" "s%__ServiceName__%${serviceName}%g" $ViewControllerPath
sed -i "" "s%APITemplateProject%${projectName}%g" $ViewControllerPath

sed -i "" "s%__ServiceName__%${serviceName}%g" $EventResponseViewControllerPath
sed -i "" "s%APITemplateProject%${projectName}%g" $EventResponseViewControllerPath

sed -i "" "s%APITemplateProject%${projectName}%g" $LifeCycleViewControllerPath

sed -i "" "s%APITemplateProject%${projectName}%g" $UITableViewControllerPath

sed -i "" "s%__ServiceName__%${serviceName}%g" $ServiceFilePath
sed -i "" "s%APITemplateProject%${projectName}%g" $ServiceFilePath

sed -i "" "s%____ServiceName____%${serviceName}%g" $TemplateCreateAPIManagerPath
sed -i "" "s%____ProjectName____%${projectName}%g" $TemplateCreateAPIManagerPath

sed -i "" "s%____ServiceName____%${serviceName}%g" $TemplateCreatePageAPIManagerPath
sed -i "" "s%____ProjectName____%${projectName}%g" $TemplateCreatePageAPIManagerPath

sed -i "" "s%____ProjectName____%${projectName}%g" $TemplateCreateServicePath

sed -i "" "s%____ProjectName____%${projectName}%g" $TemplateServicePath
sed -i "" "s%____ProjectName____%${projectName}%g" $TemplateAPIManagerPath
sed -i "" "s%____ProjectName____%${projectName}%g" $TemplatePageAPIManagerPath

sed -i "" "s%____ProjectName____%${projectName}%g" $TemplateAPIViewControllerPath
sed -i "" "s%____YEAR____%${year}%g" $TemplateAPIViewControllerPath

cd ./$projectName
pod update --verbose --no-repo-update
git init
git remote remove origin
git remote add origin $sshRepo  &> /dev/null
git rm -rf --cached ./Pods/     &> /dev/null
git rm --cached Podfile.lock    &> /dev/null
git rm --cached .DS_Store       &> /dev/null
git rm -rf --cached $projectName.xcworkspace/ &> /dev/null
git rm -rf --cached $projectName.xcodeproj/xcuserdata/`whoami`.xcuserdatad/xcschemes/$projectName.xcscheme &> /dev/null
git rm -rf --cached $projectName.xcodeproj/project.xcworkspace/xcuserdata/ &> /dev/null
git add . ; git commit -am modification ; git push origin master --tags -f
