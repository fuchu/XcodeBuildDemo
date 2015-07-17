#!/bin/sh
CONFIG_ROOT_PATH="/Users/housl/Desktop/XcodeBuildDemo/"
cd $CONFIG_ROOT_PATH
distDir="/Users/housl/Desktop/package"
rm -rdf "$distDir"
#桌面创建文件夹，存放生成的包
mkdir "$distDir"
#channel.txt 存放渠道值的配置文件
for line in $(cat channel.txt)
do
#每次打新包前清空
rm -rf "/Users/housl/Desktop/XcodeBuildDemo/build/"
#XcodeBuildDemo  需要打包的target  （当前demo值）
xcodebuild -target XcodeBuildDemo clean
ipafilename=`echo $line|cut -f1 -d':'`
echo "ipafilename=$ipafilename"
targetName=`echo ${ipafilename}`
#修改工程plist值 CFrom需要改变的key值，后面跟需要修改的plist文件路径
/usr/libexec/PlistBuddy -c "set :CFrom ${targetName}" /Users/housl/Desktop/XcodeBuildDemo/XcodeBuildDemo/proChannel.plist
#打包 XcodeBuildDemo 需要打包的target
xcodebuild -target XcodeBuildDemo -configuration Distribution -sdk iphoneos build
#生成ipa -v 打包生成的app路径
xcrun -sdk iphoneos PackageApplication -v "/Users/housl/Desktop/XcodeBuildDemo/build/Release-iphoneos/XcodeBuildDemo.app" -o "/Users/housl/Desktop/package/${targetName}.ipa"
done
