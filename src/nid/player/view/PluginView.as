package nid.player.view 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class PluginView extends Sprite implements IView 
	{
		private var _id:uint;
		public function get id():uint { return _id; }
		
		public function PluginView(id:uint)
		{
			_id = id;
			
		}
		
	}

}