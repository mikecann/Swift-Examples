package co.uk.swft.shooter.proxys.managers
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;

	public interface IScene
	{
		function registerForUpdates(updateable:IUpdateable) : void;
		function unRegisterForUpdates(updateable:IUpdateable) : void;
		function addChild(child:DisplayObject) : void;
		function removeChild(child:DisplayObject) : void;
		function get stage() : Stage;
		function get sceneContainer() : DisplayObjectContainer;
		function set sceneContainer(value:DisplayObjectContainer) : void;
	}
}