package nid.player.pools 
{
	import flash.display.Loader;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class ObjectPool 
	{
		public static const URL_LOADER:String = "flash.net::URLLoader";
		public static const LOADER:String = "flash.display::Loader";
		public static const SOUND:String = "flash.media::Sound";
		
		internal static var freePool:Vector.<PoolObject> = new Vector.<PoolObject>();
		internal static var busyPool:Vector.<PoolObject> = new Vector.<PoolObject>();
		
		public static function freePoolObject(obj:PoolObject):void {
			busyPool.splice(obj.index, 1);
			obj.index = freePool.length;
			freePool.push(obj);
		}
		public static function getPoolObject(type:String):PoolObject{
			var obj:PoolObject;
			for (var i:int = 0; i < freePool.length; i++) {
				if (freePool[i].type == type) {
					obj = freePool[i];
					freePool.splice(i, 1);
					obj.index = busyPool.length;
					busyPool.push(obj);
					return obj;
				}
			}
			obj = new PoolObject(getDefinitionByName(type));
			obj.index = busyPool.length;
			busyPool.push(obj);
			return obj;
		}
		
	}

}