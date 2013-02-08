package nid.player 
{
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	import nid.player.core.MediaFile;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MediaPlayer extends Sprite 
	{
		
		public function MediaPlayer() 
		{
			
		}
		
		public function play(any:*):void 
		{
			var mediafile:MediaFile = new MediaFile(any);
		}
		
	}

}