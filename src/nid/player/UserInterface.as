package nid.player 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import nid.player.view.IView;
	import nid.player.view.MasterConsoleView;
	import nid.player.view.PlaylistView;
	import nid.player.view.ViewList;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class UserInterface extends Sprite 
	{
		private var viewStack:Vector.<IView>;
		internal var consoleView:MasterConsoleView;
		
		public function UserInterface() 
		{
			consoleView = new MasterConsoleView();
			viewStack = new Vector.<IView>();
			viewStack.push(consoleView)
			viewStack.push(new PlaylistView())
		}
		public function addView(view:IView):IView {
			if (view == null) return null;
			viewStack.push(view);
			addChild(DisplayObject(view));
			return view;
		}
		public function getView(id:uint):IView {
			for (var i:int = 0; i < viewStack.length; i++) {
				if (viewStack[i].id == id) return viewStack[i];
			}
			return null;
		}
		public function init():void 
		{
			addChild(getView(ViewList.MASTER_CONSOLE_VIEW) as DisplayObject);
		}
		
		public function activate():void 
		{
			
		}
		
	}

}