#!/bin/bash

git pull origin master

cd ..
Cyan='\033[0;36m'
Default='\033[0;m'

projectName=""
httpsRepo=""
sshRepo=""
homePage=""
confirmed="n"
privateRepoHTTPSPath=""
privateRepoName=""

getPrivateRepoName() {
    read -p "Enter private repo name: " privateRepoName

    if test -z "$privateRepoName"; then
        privateRepoName
    fi
}

getPrivateRepoHTTPSPath() {
    read -p "Enter private repo https path: " privateRepoHTTPSPath

    if test -z "$privateRepoHTTPSPath"; then
        privateRepoHTTPSPath
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
    getPrivateRepoName
    getPrivateRepoHTTPSPath

    echo -e "\n${Default}================================================"
    echo -e "  Project Name            :  ${Cyan}${projectName}${Default}"
    echo -e "  HTTPS Repo              :  ${Cyan}${httpsRepo}${Default}"
    echo -e "  SSH Repo                :  ${Cyan}${sshRepo}${Default}"
    echo -e "  Home Page URL           :  ${Cyan}${homePage}${Default}"
    echo -e "  Private Repo HTTPS Path :  ${Cyan}${privateRepoHTTPSPath}${Default}"
    echo -e "  Private Repo Name       :  ${Cyan}${privateRepoName}${Default}"
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

git clone https://github.com/casatwy/TemplateProject.git ${projectName}

gitignoreFilePath="./${projectName}/.gitignore"
specFilePath="./${projectName}/${projectName}.podspec"
readmeFilePath="./${projectName}/readme.md"
uploadFilePath="./${projectName}/upload.sh"
podfilePath="./${projectName}/Podfile"

echo "copy to $specFilePath"
mv -f ./${projectName}/pod.podspec  "$specFilePath"
mv ./${projectName}/TemplateProject ./${projectName}/${projectName}
mkdir -p ./${projectName}/${projectName}/${projectName}
mv ./${projectName}/TemplateProject.xcodeproj ./${projectName}/${projectName}.xcodeproj

echo "editing..."
sed -i "" "s%__ProjectName__%${projectName}%g" "$readmeFilePath"
sed -i "" "s%TemplateProject%${projectName}%g" "$readmeFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$gitignoreFilePath"
sed -i "" "s%TemplateProject%${projectName}%g" "$gitignoreFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$uploadFilePath"
sed -i "" "s%TemplateProject%${projectName}%g" "$uploadFilePath"
sed -i "" "s%__PrivateRepoName__%${privateRepoName}%g" "$uploadFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$specFilePath"
sed -i "" "s%__HomePage__%${homePage}%g"      "$specFilePath"
sed -i "" "s%__HTTPSRepo__%${httpsRepo}%g"    "$specFilePath"
sed -i "" "s%TemplateProject%${projectName}%g" "$specFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g" "$podfilePath"
sed -i "" "s%__PrivateRepoHTTPSPath__%${privateRepoHTTPSPath}%g" "$podfilePath"
sed -i "" "s%TemplateProject%${projectName}%g" "$podfilePath"
  
sed -i "" "s%TemplateProject%${projectName}%g" "./${projectName}/${projectName}.xcodeproj/project.pbxproj"
sed -i "" "s%TemplateProject%${projectName}%g" "./${projectName}/${projectName}.xcodeproj/project.xcworkspace/contents.xcworkspacedata"


echo "edit finished"

echo "cleaning..."
cd ./$projectName
git init
git remote remove origin
git remote add origin $sshRepo  &> /dev/null
git rm -rf --cached ./Pods/     &> /dev/null
git rm --cached Podfile.lock    &> /dev/null
git rm --cached .DS_Store       &> /dev/null
git rm -rf --cached $projectName.xcworkspace/ &> /dev/null
git rm -rf --cached $projectName.xcodeproj/xcuserdata/`whoami`.xcuserdatad/xcschemes/$projectName.xcscheme &> /dev/null
git rm -rf --cached $projectName.xcodeproj/project.xcworkspace/xcuserdata/ &> /dev/null
pod update --verbose --no-repo-update
git add . ; git commit -am modification ; git push origin master --tags
echo "clean finished"
say "finished"
echo "finished"
