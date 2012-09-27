[protobuf-actionscript3][1]所依赖的**int64**类库[as3cypto][2]带过于繁琐，降低了编解码性能并且导入过多代码，我就重新写了**BigInteger**类，但是包路径包路径沿用了[as3cypto][2]的格式，这是因为protobuf生成代码硬编码导入**com.hurlant.math.BigInteger**，希望有人能够修复此问题。
[1]: http://code.google.com/p/protobuf-actionscript3/ "http://code.google.com/p/protobuf-actionscript3/"
[2]: http://code.google.com/p/as3crypto/ "http://code.google.com/p/as3crypto/"