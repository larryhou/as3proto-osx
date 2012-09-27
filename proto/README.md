# hello.proto是一个简单的示例
- - - - - - -

### protobuf message 
	message HelloWorld{
		optional int32 code = 1;
		optional string name = 2;
		optional Info info = 3;

		message Info{
			optional string version = 1;
		}
	}

### 生成字节码
```actionscript
var output:ByteArray = new ByteArray();
var hello:HelloWorld = new HelloWorld();
hello.writeToDataOutput(output);
```

### 读取字节码
```actionscript
var input:ByteArray;
var hello:HelloWorld = new HelloWorld();
hello.readFromDataOutput(input);
```
