package nid.player.plugins 
{
	import flash.display.DisplayObject;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import nid.player.events.PlayerEvent;
	import nid.player.MediaPlayer;
	import nid.player.view.IView;
	import nid.player.view.PluginView;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Waveform extends PluginBase implements IPlugin 
	{
		private var ui:WaveformUI;
		private var _view:PluginView;
		public function get id():uint { return PluginList.WAVEFORM; }
		public function get view():IView { return _view; }
		
		public function Waveform() 
		{
			_view = new PluginView(id);
			_view.x = 512;
			ui = new WaveformUI();
			_view.addChild(ui);
		}
		
		public function init():void {
			MediaPlayer.getInstance().notifier.addEventListener(PlayerEvent.DATA_READY, update);
		}
		
		private function update(e:PlayerEvent):void 
		{
			var data:ByteArray = new ByteArray();
			var sound:Sound = MediaPlayer.getInstance().file.sound;
			sound.extract(data, sound.length);
			trace('update' + data.length, sound.length);
		}
		
		public function process():void {
			
		}
	}

}