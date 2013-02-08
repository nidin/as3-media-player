package nid.player.core.files 
{
	import avmplus.getQualifiedClassName;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import nid.player.core.AudioOutput;
	import nid.player.pools.ObjectPool;
	import nid.player.pools.PoolObject;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MP3File extends BaseFile implements IFile
	{
		private var sound:Sound;
		
		public function MP3File() 
		{
			
		}
		public function load(req:URLRequest):void {
			if (sound == null) { 
				sound = ObjectPool.getPoolObject(ObjectPool.SOUND).instance as Sound;
				sound.addEventListener(Event.COMPLETE, onSoundComplete);
			}
			sound.load(req);
			AudioOutput.instance.channel = sound.play();
		}
		
		private function onSoundComplete(e:Event):void 
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, onSoundComplete);
			
		}
		public function loadBytes(bytes:ByteArray):void {
			
		}
		
		/**
		 * Event Handlers
		 */
		
		private function onID3Ready(e:Event):void 
		{
			
		}
	}
}