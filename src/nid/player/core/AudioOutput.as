package nid.player.core 
{
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class AudioOutput 
	{
		internal static var instance:AudioOutput;
		public static function getInstance():AudioOutput {
			if (instance == null) { instance = new AudioOutput(); }
			return instance;
		}
		public function AudioOutput() 
		{
			if (instance!=null) {
				throw(Error('AudioOutput is a singleton Class, an instance is already created'));
			}
		}
		
	}

}