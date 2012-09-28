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
	
2. #####检查protobuf是否安装成功
	在Terminal中输入，回车
	```
	protoc --help
	```
	
	检查一下帮助内容是否包含**--as3_out**选项
	```
    --as3_out=OUT_DIR           Generate ActionScript source file.
    --cpp_out=OUT_DIR           Generate C++ header and source.
    --java_out=OUT_DIR          Generate Java source file.
    --python_out=OUT_DIR        Generate Python source file.
	```
	
3. #####使用命令行生成AS3代码	
	```
	protoc --proto_path=proto --as3_out=output proto/hello.proto
	```
	
4. #####使用protobuf.sh快速代码生成
	使用文本编辑器打开**protobuf.sh**文件
	* 把**OUTPUT_DIR**设置成AS3保存目录，支持绝对目录、相对目录
	* 把**PROTO_DIR**设置成\*.proto文件存储目录   
	
	在**Terminal**里面进入**protobuf.sh**所在目录，运行  
	
	```
	sh protobuf.sh
	```
	
	在**OUTPUT_DIR**里面就可以得到相应的AS3代码  
	```
	- - - - - - - - - - - - -
	Type proto file name:
	hello

	-> proto/hello.proto
	- - - - -

	DONE! Press ENTER key to continue...

	```

	