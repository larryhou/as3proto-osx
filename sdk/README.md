#Windows平台使用[protobuf-actionscript3][1]
- - - - - -
[1]: http://code.google.com/p/protobuf-actionscript3/ "http://code.google.com/p/protobuf-actionscript3/"
[2]: http://mingw.org/wiki/Getting_Started "http://mingw.org/wiki/Getting_Started"
[3]: http://sourceforge.net/projects/mingw/files/Installer/mingw-get-inst/ "http://sourceforge.net/projects/mingw/files/Installer/mingw-get-inst/"

## 1. 安装[MinGW][2]  
* 下载**[mingw-get installer][3]**，保持默认配置一路“**Next**”直至安装完成
* 把安装目录**C:\MinGW\bin**添加PATH环境变量，注销电脑重新进入系统
* 打开命令提示符运行  
  	
		mingw-get install gcc g++ mingw32-make msys-base
	
		
* 初始化**MSYS shell**并启动  
  	
		cd C:\MSYS\1.0
		
		rem 启动MSYS shell
		msys.bat
		
		rem 初始化MSYS shell，第一次启动时运行
		/postinstall/pi.sh
	
	
## 2. 编译安装 protobuf 命令行
* **CD**到源码目录
    
	如果源码在**D:/as3proto-osx/sdk/src**目录，需要使用
  
		cd /d/as3proto-osx/sdk/src
		
* 编译安装**protobuf**
  
		./configure --prefix=/mingw
		
		make		
		make check		
		make install
	
* 检查是否安成功
	打开命令提示符，输入
  
		protoc --help
		
	安装成功后应该出现如下信息，包含**--as3_out**参数
	
		Usage: protoc [OPTION] PROTO_FILES
		Parse PROTO_FILES and generate output based on the options given:
		  -IPATH, --proto_path=PATH   Specify the directory in which to search for
		                              imports.  May be specified multiple times;
		                              directories will be searched in order.  If not
		                              given, the current working directory is used.
		  --version                   Show version info and exit.
		  -h, --help                  Show this text and exit.
		  --encode=MESSAGE_TYPE       Read a text-format message of the given type
		                              from standard input and write it in binary
		                              to standard output.  The message type must
		                              be defined in PROTO_FILES or their imports.
		  --decode=MESSAGE_TYPE       Read a binary message of the given type from
		                              standard input and write it in text format
		                              to standard output.  The message type must
		                              be defined in PROTO_FILES or their imports.
		  --decode_raw                Read an arbitrary protocol message from
		                              standard input and write the raw tagalue
		                              pairs in text format to standard output.  No
		                              PROTO_FILES should be given when using this
		                              flag.
		  -oFILE,                     Writes a FileDescriptorSet (a protocol buffer,
		    --descriptor_set_out=FILE defined in descriptor.proto) containing all of
		                              the input files to FILE.
		  --include_imports           When using --descriptor_set_out, also include
		                              all dependencies of the input files in the
		                              set, so that the set is self-contained.
		  --error_format=FORMAT       Set the format in which to print errors.
		                              FORMAT may be 'gcc' (the default) or 'msvs'
		                              (Microsoft Visual Studio format).
		  --plugin=EXECUTABLE         Specifies a plugin executable to use.
		                              Normally, protoc searches the PATH for
		                              plugins, but you may specify additional
		                              executables not in the path using this flag.
		                              Additionally, EXECUTABLE may be of the form
		                              NAME=PATH, in which case the given plugin name
		                              is mapped to the given executable even if
		                              the executable's own name differs.
		  --as3_out=OUT_DIR           Generate ActionScript source file.
		  --cpp_out=OUT_DIR           Generate C++ header and source.
		  --java_out=OUT_DIR          Generate Java source file.
		  --python_out=OUT_DIR        Generate Python source file.
