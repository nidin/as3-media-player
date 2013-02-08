package nid.player.core.files 
{
	import avmplus.getQualifiedClassName;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import nid.player.pools.ObjectPool;
	import nid.player.pools.PoolObject;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MP3File extends BaseFile implements IFile
	{
		
		public function MP3File() 
		{
			
		}
		public function load(req:URLRequest):void {
			var obj:PoolObject = ObjectPool.getPoolObject(ObjectPool.SOUND);
			var sound:Sound = obj.instance as Sound;
			sound.load(req);
		}
		public function loadBytes(bytes:ByteArray):void {
			
		}
	}

}