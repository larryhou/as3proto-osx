package com.hurlant.math
{
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	import flash.utils.Endian;
	
	/**
	 * 无符号64位整形
	 * @author larryhou
	 * @createTime 2012/9/27 10:42
	 */
	public class BigInteger 
	{
		 /**
		  * 1常量
		  */
		 
		public static const ONE:BigInteger = new BigInteger(1);
		
		/**
		 * 0常量 
		 */		
		public static const ZERO:BigInteger = new BigInteger(0);
		
		// 8个字节长度
		private const BYTE_LENGTH:uint = 8;
		
		// 字节存储
		private var _bytes:ByteArray;
		
		/**
		 * 构造函数
		 * create a [BigInteger] object
		 * @param	value	该字段可以为[int/uint/Number/ByteArray]对象，不支持string传参
		 * @notice	value为Number类型时，会被取整
		 */
		public function BigInteger(value:* = 0)
		{
			var name:String = describeType(value).@name;
			switch(name)
			{
				case "int":
				case "Number":
				{
					fromInt(int(value));
					break;
				}
				
				case  "flash.utils::ByteArray":
				{
					fromByteArray(value as ByteArray);
					break;
				}
				
				default:
				{
					fromInt(0);
					break;
				}
			}
		}
		
		/**
		 * 从整形初始化
		 * @param	value
		 */
		private function fromInt(value:int):void
		{
			_bytes = new ByteArray();
			
			_bytes.length = BYTE_LENGTH;
			
			_bytes.position = BYTE_LENGTH / 2;
			_bytes.writeUnsignedInt(value);
			
			_bytes.position = 0;
		}
		
		/**
		 * 从字节数组初始化
		 * @param	bytes
		 */
		private function fromByteArray(bytes:ByteArray):void
		{
			_bytes = new ByteArray();
			_bytes.length = BYTE_LENGTH;
			
			_bytes.position = 0;
			_bytes.writeBytes(bytes, 0, Math.min(bytes.length, BYTE_LENGTH));
			
			// 矫正字节序
			bytes.endian == Endian.LITTLE_ENDIAN && reverse(_bytes);
			
			_bytes.position = 0;
		}
		
		/**
		 * 字节反转
		 * @param	bytes
		 */
		private function reverse(bytes:ByteArray):ByteArray
		{
			var data:ByteArray = new ByteArray();
			
			data.writeBytes(bytes);
			data.length = BYTE_LENGTH;
			
			bytes.length = 0;
			
			var length:int = data.length;
			for (var i:int = 0; i < length; i++)
			{
				bytes.writeByte(data[length - 1 - i]);
			}
			
			return bytes;
		}
		
		/**
		 * 与运算
		 * @param	value BigInteger对象
		 * @return 不同引用的BigInteger对象
		 */
		public function and(value:BigInteger):BigInteger
		{
			var result:ByteArray = new ByteArray();
			
			var length:int = _bytes.length;
			for (var i:int = 0; i < length; i++)
			{
				result.writeByte(_bytes[i] & value._bytes[i]);
			}
			
			return new BigInteger(result);
		}
		
		/**
		 * 或运算
		 * @param	value BigInteger对象
		 * @return 不同引用的BigInteger对象
		 */
		public function or(value:BigInteger):BigInteger
		{
			var result:ByteArray = new ByteArray();
			
			var length:int = _bytes.length;
			for (var i:int = 0; i < length; i++)
			{
				result.writeByte(_bytes[i] | value._bytes[i]);
			}
			
			return new BigInteger(result);
		}
		
		/**
		 * 异或运算
		 * @param	value BigInteger对象
		 * @return 不同引用的BigInteger对象
		 */
		public function xor(value:BigInteger):BigInteger
		{
			var result:ByteArray = new ByteArray();
			
			var length:int = _bytes.length;
			for (var i:int = 0; i < length; i++)
			{
				result.writeByte(_bytes[i] ^ value._bytes[i]);
			}
			
			return new BigInteger(result);
		}
		
		/**
		 * 相等比较运算
		 * @param	value BigInteger对象
		 * @return 数值相等返回true，反之为false
		 */
		public function equals(value:BigInteger):Boolean
		{
			var length:int = _bytes.length;
			for (var i:int = 0; i < length; i++)
			{
				if (_bytes[i] ^ value._bytes[i]) return false;
			}
			
			return true;
		}
		
		/**
		 * 左位移操作
		 * @param	offset 位移量
		 * @return 不同引用的BigInteger对象
		 */
		public function shiftLeft(offset:uint):BigInteger
		{
			var result:BigInteger = this.clone();
			if (offset == 0) return result;
			
			var bytes:ByteArray = result._bytes;
			
			var chunks:int = offset / 8 >> 0;
			
			var prefix:uint, i:int;
			var length:int = bytes.length;
			
			if(chunks > 0)
			{
				for (i = 0; i < length; i++)
				{
					if(i <= length - chunks)
					{
						bytes[i] = bytes[i + chunks];
					}
					else
					{
						bytes[i] = 0;
					}
				}
			}
			
			offset %= 8;
			var mask:uint = 0;
			for (i = 1; i <= offset; i++) mask |= 1 << (8 - i);
			
			for (i = 0; i < length; i++)
			{
				prefix = bytes[i] & mask;
				
				if(i > 0)
				{
					bytes[i - 1] |= prefix >> (8 - offset);
				}
				
				bytes[i] = (bytes[i] << offset) & 0xFF;
			}
			
			return result;
		}
		
		/**
		 * 右位移操作
		 * @param	offset 位移量
		 * @return 不同引用的BigInteger对象
		 */
		public function shiftRight(offset:uint):BigInteger
		{
			var result:BigInteger = this.clone();
			if (offset == 0) return result;
			
			var bytes:ByteArray = result._bytes;
			
			var chunks:int = offset / 8 >> 0;
			
			var prefix:uint, i:int;
			var length:int = bytes.length;
			
			if(chunks > 0)
			{
				for (i = length - 1; i >= 0; i--)
				{
					if(i >= chunks)
					{
						bytes[i] = bytes[i - chunks];
					}
					else
					{
						bytes[i] = 0;
					}
				}
			}
			
			offset %= 8;
			var mask:uint = 0;
			for (i = 0; i < offset; i++) mask |= 1 << i;
			
			for (i = length - 1; i >= 0; i--)
			{
				prefix = bytes[i] & mask;
				
				if (i < length - 1)
				{
					bytes[i + 1] |= prefix << (8 - offset);
				}
				
				bytes[i] = (bytes[i] >> offset) & 0xFF;
			}
			
			return result;
		}
		
		/**
		 * 读取低位字节
		 * @return -128~128
		 */
		public function byteValue():int
		{
			_bytes.position = 7;
			return _bytes.readByte();
		}
		
		/**
		 * 克隆数据
		 * @return 不同引用的BigInteger对象
		 */
		public function clone():BigInteger
		{
			var result:ByteArray = new ByteArray();
			result.writeBytes(_bytes);
			
			return new BigInteger(result);
		}
		
		/**
		 * 生成字节数据
		 * @return 字节复制得到的ByteArray对象
		 */		
		public function toByteArray():ByteArray 
		{
			var result:ByteArray = new ByteArray();
			result.writeBytes(_bytes);
			result.position = 0;
			
			return result;
		}
	}

}