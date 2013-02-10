package nid.player.core.files 
{
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public interface IFile 
	{
		function load(req:URLRequest):void;		
		function loadBytes(bytes:ByteArray):void;
	}
	
}