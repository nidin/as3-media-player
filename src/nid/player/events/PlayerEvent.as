package nid.player.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class PlayerEvent extends Event 
	{
		public static const PLAY:String = "play"
		public static const PAUSE:String = "pause"
		public static const STOP:String = "stop"
		public static const FINISH:String = "finish"
		public static const NEXT:String = "next"
		public static const PREVIOUS:String = "previous"
		
		public var data:Object;
		
		public function PlayerEvent(type:String,data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
	}
	
}