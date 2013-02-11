package nid.player.view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import nid.player.utils.TimeUtils;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MasterConsoleView extends Sprite implements IView
	{
		public function get id():uint { return ViewList.MASTER_CONSOLE_VIEW; }
		
		private var displayPanel:DisplayPanelUI;
		private var duration:Number;
		
		public function MasterConsoleView() 
		{
			displayPanel = new DisplayPanelUI();
			addChild(displayPanel);
			displayPanel.timeline.head.scrub.alpha = 0;
			TextField(displayPanel.time.total).autoSize = TextFieldAutoSize.LEFT
		}
		
		public function updateTime(t:Number):void 
		{
			displayPanel.time.played.text = TimeUtils.getTimeFormat(t);
			displayPanel.timeline.played.width = Math.round(t / duration * 472);
			displayPanel.timeline.head.x = Math.round(t / duration * 472);
		}
		
		public function updateTotalTime(duration:Number):void 
		{
			this.duration = duration;
			displayPanel.time.total.text = TimeUtils.getTimeFormat(duration) + "/";
			displayPanel.time.played.x = displayPanel.time.total.width + 5;
		}
		
		public function updateInfo(info:Object):void 
		{
			displayPanel.file_info.title.text = info.title
			displayPanel.file_info.artist.text = info.artist
			displayPanel.file_info.album.text = info.album
		}
		
		public function updateTrack(value:String):void 
		{
			displayPanel.track.text = value;
		}
		
	}

}