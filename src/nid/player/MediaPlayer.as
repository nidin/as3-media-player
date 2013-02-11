package nid.player 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	import nid.player.core.AudioOutput;
	import nid.player.core.files.PlaylistFile;
	import nid.player.core.MediaFile;
	import nid.player.events.PlayerEvent;
	import nid.player.plugins.Equalizer;
	import nid.player.plugins.IPlugin;
	import nid.player.plugins.Synthesizer;
	import nid.player.plugins.Waveform;
	
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
		public static function getInstance():MediaPlayer {
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
			plugins.push(new Waveform());
			
			timer 		= new Timer(100);
			timer.addEventListener(TimerEvent.TIMER, updateTime);
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			notifier.addEventListener(PlayerEvent.START, startTimer);
			notifier.addEventListener(PlayerEvent.ID3_READY, updateID3);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(ui);
			ui.init();
			initPlugin();
			//addEventListener(Event.ENTER_FRAME, processAll);
		}
		
		private function processAll(e:Event):void 
		{
			for (var i:int = 0; i < plugins.length; i++) {
				plugins[i].process();
			}
		}
		
		public function registerPlugin(plugin:IPlugin):uint {
			for (var i:int = 0; i < plugins.length; i++) {
				if (plugins[i].id == plugin.id) {
					throw(Error('Duplicate Plugin ID, a plugin is already registred with this ID:' + plugin.id + ',[' + plugins[i] + ']'));
					return;
				}
			}
			return plugins.push(plugin);
		}
		
		public function initPlugin():void {
			for (var i:int = 0; i < plugins.length; i++) {
				ui.addView(plugins[i].view);
				plugins[i].init();
			}
		}
		/**
		 * Properties
		 */
		public function get file():MediaFile {
			return mediafile;
		}
		/**
		 * Event Handler
		 */
		
		private function updateID3(e:PlayerEvent):void 
		{
			ui.consoleView.updateInfo(mediafile.info);
		}
		
		private function startTimer(e:PlayerEvent):void 
		{
			timer.start();
			setTimeout(updateLater, 100);
		}
		
		private function updateLater():void 
		{
			ui.consoleView.updateTotalTime(mediafile.duration);
		}
		private function updateTime(e:TimerEvent):void 
		{
			ui.consoleView.updateTime(mediafile.position);
		}
		
		public function play(any:*):void 
		{
			if (mediafile == null) mediafile = new MediaFile();
			mediafile.load(any);
			if(playlist!=null){
				ui.consoleView.updateTrack("")
			}else {
				ui.consoleView.updateTrack("1/1");
			}
		}
		
		public function loadPlayList(pl:String):void 
		{
			if (playlist == null) playlist = new PlaylistFile();
			playlist.load(pl);
		}
		
	}

}