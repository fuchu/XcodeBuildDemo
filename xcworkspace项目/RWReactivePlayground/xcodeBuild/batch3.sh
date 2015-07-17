#!/bin/sh
proPath="/Users/housl/Desktop/RWReactivePlayground"
CONFIG_ROOT_PATH="/Users/housl/Desktop/RWReactivePlayground/xcodeBuild"
cd $CONFIG_ROOT_PATH
distDir="/Users/housl/Desktop/package"
rm -rdf "$distDir"
#桌面创建文件夹，存放生成的包
mkdir "$distDir"
#每次打新包前清空
rm -rf "/Users/housl/Desktop/RWReactivePlayground/buildPath/"
#channel.txt 存放渠道值的配置文件
for line in $(cat channel.txt)
do

cd $proPath

#RWReactivePlayground  需要打包的target  （当前demo值）
#xcodebuild -target RWReactivePlayground clean
xcodebuild -workspace *.xcwork* -scheme RWReactivePlayground -configuration Distribution clean
ipafilename=`echo $line|cut -f1 -d':'`
echo "ipafilename=$ipafilename"
targetName=`echo ${ipafilename}`
#修改工程plist值 CFrom需要改变的key值，后面跟需要修改的plist文件路径
/usr/libexec/PlistBuddy -c "set :CFrom ${targetName}" /Users/housl/Desktop/RWReactivePlayground/RWReactivePlayground/proChannel.plist

#-configuration Distribution(release模式) Debug(debug模式) Release（relsease模式） 省略(debug模式) 随意字符(relsease模式)
xcodebuild -workspace *.xcwork* -scheme RWReactivePlayground -configuration Distribution -derivedDataPath "/Users/housl/Desktop/RWReactivePlayground/buildPath/" -sdk iphoneos build
#cp -r 拷贝包含目录
cp -r "/Users/housl/Desktop/RWReactivePlayground/buildPath/Build/Products/Release-iphoneos/RWReactivePlayground.app.dSYM" "/Users/housl/Desktop/package/${targetName}.app.dSYM"

xcrun -sdk iphoneos PackageApplication -v "/Users/housl/Desktop/RWReactivePlayground/buildPath/Build/Products/Release-iphoneos/RWReactivePlayground.app" -o "/Users/housl/Desktop/package/${targetName}.ipa"

#生成ipa -v 打包生成的app路径
#每次打新包后也清空
rm -rf "/Users/housl/Desktop/RWReactivePlayground/build/"

done























