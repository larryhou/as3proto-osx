这是一个轻量级的存储64位整形BigInteger类，[protobuf-actionscript3][1]生成的AS3代码依赖此类才能正常编解码**protobuf**的**message**二进制数据，但是原始类库[as3cypto][2]带过于繁琐，降低了编解码性能并且导入过多代码。这个BigInteger类保持了[as3cypto][2]的包路径，这是因为protobuf生成代码硬编码导入**com.hurlant.math.BigInteger**，暂时也就这么用吧

[1]: http://code.google.com/p/protobuf-actionscript3/ "http://code.google.com/p/protobuf-actionscript3/"
[2]: http://code.google.com/p/as3crypto/ "http://code.google.com/p/as3crypto/"