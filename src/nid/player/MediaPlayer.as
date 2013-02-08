package nid.player 
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import nid.player.core.files.PlaylistFile;
	import nid.player.core.MediaFile;
	import nid.player.plugins.IPlugin;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MediaPlayer extends Sprite 
	{
		private var mediafile:MediaFile;
		private var playlist:PlaylistFile;
		private var plugins:Vector.<IPlugin>;
		private var timer:Timer;
		private var ui:UserInterface;
		
		public var notifier:EventDispatcher;
		
		private static var _instance:MediaPlayer;
		public static function get instance():MediaPlayer {
			if (_instance == null) { _instance = new MediaPlayer(); }
			return _instance;
		}
		public function MediaPlayer() 
		{
			if (_instance!=null) {
				throw(Error('[ERROR] MediaPlayer is a singleton Class, an instance is already created'));
				return;
			}
			ui 			= new UserInterface();
			notifier 	= new EventDispatcher();
			plugins 	= new Vector.<IPlugin>();
			timer 		= new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, updateTime);
			
			ui.init();
		}
		
		private function updateTime(e:TimerEvent):void 
		{
			
		}
		
		public function play(any:*):void 
		{
			if (mediafile == null) mediafile = new MediaFile();
			mediafile.load(any);
		}
		
		public function loadPlayList(pl:String):void 
		{
			if (playlist == null) playlist = new PlaylistFile();
			playlist.load(pl);
		}
		
	}

}