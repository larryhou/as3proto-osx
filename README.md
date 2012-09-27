# as3proto-osx
------------

### protobuf for Actionscript 3 on OSX platform
该项目搭建了AS3 protobuf所需的Windows运行环境以及AS3类库，整合了Google [protobuf][1]和[protobuf-actionscript3][2]第三方插件资源
[1]: http://code.google.com/p/protobuf/ "[v2.3.0] http://code.google.com/p/protobuf/"
[2]: http://code.google.com/p/protobuf-actionscript3/ "http://code.google.com/p/protobuf-actionscript3/"

### 使用方法
1. #####编译安装protoc命令行    
	在**Terminal**里面进入**sdk**目录，运行下面脚本
	```
	./configure
	make
	make check
	sudo make install
	```
	
2. #####使用protoc生成代码
	
	```
	protoc --proto_path=proto --as3_out=output proto/hello.proto
	```