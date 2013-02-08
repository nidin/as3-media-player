package nid.player.core 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import nid.player.core.files.BaseFile;
	import nid.player.core.files.IFile;
	import nid.player.core.files.MP3File;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MediaFile 
	{
		public static const MP3:String = "mp3";
		public static const AAC:String = "aac";
		public static const WMA:String = "wma";
		public static const WAV:String = "wav";
		public static const AVI:String = "avi";
		public static const MOV:String = "mov";
		public static const MP4:String = "mp4";
		public static const _3GP:String = "3gp";
		
		private var stream:URLStream;
		private var header:ByteArray;
		private var file:IFile;
		private var req:URLRequest;
		private var reqType:uint;
		private var bytes:ByteArray;
		
		public var id:String;
		public var type:String;
		
		public function MediaFile(any:*= null) {
			if (any != null)
			load(any);
		}
		
		public function load(any:*):void {
			if (any is String) {
				req = new URLRequest(any as String);
				header = new ByteArray();
				stream = new URLStream();
				stream.addEventListener(ProgressEvent.PROGRESS, readStream);
				stream.load(req);
				reqType = 0;
			}else if (any is ByteArray) {
				reqType = 1;
				bytes = any as ByteArray;
			}
		}
		private function readStream(e:ProgressEvent):void {
			if (e.bytesLoaded > 24) {
				stream.readBytes(header, 0, 24);
				trace(header.length);
				header.position = 0;
				if (header.readByte() == 0x49 && header.readByte() == 0x44 && header.readByte() == 0x33) {
					type = MP3;
					stream.close();
					header.clear();
					process();
					trace('Media Type:' + type);
				}
			}
		}
		private function process():void 
		{
			if(type == MP3){
				file = new MP3File();
				reqType == 0?file.load(req):file.loadBytes(bytes);
			}
		}
		public static function getType(any:*):String {
			if (any is String) {
				
			}else if (any is ByteArray) {
				
			}
			return MP3;
		}
		
	}

}