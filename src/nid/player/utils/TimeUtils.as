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
			t = t / 1000;
			var sec:Number = Math.round(t % 60);
			t = t / 60;
			var min:Number = Math.round(t % 60);
			//var hr:Number = min / HOUR_CONST;
			trace(sec, min);
			//if (hr > 1) {
				//
			//}else if (min > 1) {
				//
				//s = "00:" + sec > 9 ? sec:"0" + sec;
			//}else {
				//s = "00:" + sec > 9 ? sec:"0" + sec;
			//}
			s = (min > 9 ? min : "0" + min) +":" + (sec > 9?sec:"0" + sec);
			return s;
		}
	}

}