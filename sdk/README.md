#Windows平台使用[protobuf-actionscript3][1]
- - - - - -
[1]: http://code.google.com/p/protobuf-actionscript3/ "http://code.google.com/p/protobuf-actionscript3/"
[2]: http://mingw.org/wiki/Getting_Started "http://mingw.org/wiki/Getting_Started"
[3]: http://sourceforge.net/projects/mingw/files/Installer/mingw-get-inst/ "http://sourceforge.net/projects/mingw/files/Installer/mingw-get-inst/"

### 1. 安装[MinGW][2]  
* 下载**[mingw-get installer][3]**，保持默认配置一路“**Next**”
* 把安装目录**C:\MinGW\bin**添加PATH环境变量，注销电脑重新进入系统
* 打开命令提示符运行  
  	
	```
	mingw-get install gcc g++ mingw32-make msys-base
	```
		
* 初始化**MSYS shell**并启动  
  	
	```
	cd C:\MSYS\1.0ß
		
	rem 启动MSYS shell
	msys.bat
		
	rem 初始化MSYS shell，第一次启动时运行
	/postinstall/pi.sh
	```