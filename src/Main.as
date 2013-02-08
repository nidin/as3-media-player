package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import nid.player.MediaPlayer;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var player:MediaPlayer = new MediaPlayer();
			addChild(player);
			player.play('mp3/Tujhe Bhula Diya.mp3');
		}
		
	}
	
}