package nid.player.view 
{
	import flash.display.Sprite;
	import nid.player.utils.TimeUtils;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class MasterConsoleView extends Sprite implements IView
	{
		public function get id():uint { return ViewList.MASTER_CONSOLE_VIEW; }
		
		private var displayPanel:DisplayPanel;
		
		public function MasterConsoleView() 
		{
			displayPanel = new DisplayPanel();
			addChild(displayPanel);
		}
		
		public function updateTime(t:Number):void 
		{
			displayPanel.time.played.text = TimeUtils.getTimeFormat(t);
		}
		
	}

}