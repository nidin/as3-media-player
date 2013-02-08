package nid.player.core.files 
{
	import flash.net.URLLoader;
	import nid.player.pools.ObjectPool;
	import nid.player.pools.PoolObject;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class PlaylistFile 
	{
		
		public function PlaylistFile() 
		{
			
		}
		
		public function load(pl:String):void 
		{
			var obj:PoolObject = ObjectPool.getPoolObject(ObjectPool.URL_LOADER);
			var l:URLLoader = obj.instance as URLLoader;
			
		}
		
	}

}