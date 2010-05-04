package co.uk.swft.shooter.proxys.interfaces
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;

	public interface IScene
	{
		function start(sceneContainer:DisplayObjectContainer) : void;
		function registerForUpdates(updateable:IUpdateable) : void;
		function unRegisterForUpdates(updateable:IUpdateable) : void;
		function addChild(child:DisplayObject) : void;
		function removeChild(child:DisplayObject) : void;
		function get stage() : Stage;
	}
}