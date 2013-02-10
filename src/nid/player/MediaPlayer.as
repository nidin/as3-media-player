package nid.player 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import nid.player.core.AudioOutput;
	import nid.player.core.files.PlaylistFile;
	import nid.player.core.MediaFile;
	import nid.player.events.PlayerEvent;
	import nid.player.plugins.Equalizer;
	import nid.player.plugins.IPlugin;
	import nid.player.plugins.Synthesizer;
	
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
			plugins.push(new Equalizer());
			plugins.push(new Synthesizer());
			
			timer 		= new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, updateTime);
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			notifier.addEventListener(PlayerEvent.START, startTimer);
			
		}
		
		private function startTimer(e:PlayerEvent):void 
		{
			timer.start();
		}
		private function updateTime(e:TimerEvent):void 
		{
			ui.consoleView.updateTime(mediafile.position);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(ui);
			ui.init();
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