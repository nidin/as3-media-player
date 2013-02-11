package nid.player.core.files 
{
	import avmplus.getQualifiedClassName;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import nid.player.core.AudioOutput;
	import nid.player.events.PlayerEvent;
	import nid.player.MediaPlayer;
	import nid.player.pools.ObjectPool;
	import nid.player.pools.PoolObject;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MP3File extends BaseFile implements IFile
	{
		private var _sound:Sound;
		private var _info:Object;
		
		public function get sound():Sound {
			return _sound;
		}
		
		public function MP3File() 
		{
			
		}
		public function load(req:URLRequest):void {
			if (_sound == null) { 
				_sound = ObjectPool.getPoolObject(ObjectPool.SOUND).instance as Sound;
				_sound.addEventListener(Event.COMPLETE, onSoundComplete);
				_sound.addEventListener(Event.ID3, onID3Ready);
			}
			_sound.load(req);
			AudioOutput.instance.channel = _sound.play();
			MediaPlayer.getInstance().notifier.dispatchEvent(new PlayerEvent(PlayerEvent.START));
		}
		
		private function onSoundComplete(e:Event):void 
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, onSoundComplete);
			
		}
		public function loadBytes(bytes:ByteArray):void {
			
		}
		/**
		 * Properties
		 */
		public function get info():Object {
			if (_info == null) {
				_info = { title:_sound.id3.songName, artist:_sound.id3.artist, album:_sound.id3.album };
			}
			return _info;
		}
		public function get duration():Number {
			if (_sound != null) {
				return _sound.length;
			}
			return -1;
		}
		/**
		 * Event Handlers
		 */
		
		private function onID3Ready(e:Event):void 
		{
			MediaPlayer.getInstance().notifier.dispatchEvent(new PlayerEvent(PlayerEvent.ID3_READY));
		}
	}
}