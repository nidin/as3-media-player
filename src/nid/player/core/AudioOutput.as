package nid.player.core 
{
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class AudioOutput 
	{
		private static var _instance:AudioOutput;
		public static function get instance():AudioOutput {
			if (_instance == null) { _instance = new AudioOutput(); }
			return _instance;
		}
		
		
		public var channel:SoundChannel;
		
		public function AudioOutput() 
		{
			if (_instance!=null) {
				throw(Error('[ERROR] AudioOutput is a singleton Class, an instance is already created'));
			}
		}
		
	}

}