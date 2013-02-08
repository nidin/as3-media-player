package nid.player.pools 
{
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class PoolObject 
	{
		public var instance:*;
		public var free:Boolean;
		public var type:String;
		public var index:int;
		
		public function PoolObject(instance:*) 
		{
			this.instance = instance;
			type = getQualifiedClassName(instance);
		}
		
	}

}