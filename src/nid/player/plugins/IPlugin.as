package nid.player.plugins 
{
	import flash.display.DisplayObject;
	import nid.player.view.IView;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public interface IPlugin 
	{
		function get id():uint;
		function get view():IView;
		
		function process():void;
		function init():void;
	}
	
}