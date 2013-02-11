package nid.player.utils 
{
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class TimeUtils 
	{
		private static const SEC_CONST:int = 1000;
		private static const MIN_CONST:int = 60000;
		private static const HOUR_CONST:int = 3600000;
		
		public function TimeUtils() 
		{
			
		}
		public static function getTimeFormat(t:Number):String
		{
			var s:String = "";
			var sec:Number = Math.floor(t / 1000);
			var min:Number = Math.floor(sec / 60);
			sec %= 60;
			s = (min > 9 ? min : "0" + min) +":" + (sec > 9?sec:"0" + sec);
			return s;
		}
	}

}