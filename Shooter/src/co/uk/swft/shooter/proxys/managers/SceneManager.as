package co.uk.swft.shooter.proxys.managers
{	
	import co.uk.swft.base.Entity;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SceneManager extends Actor implements IScene
	{	
		// Assets
		[Embed(source="assets/assets.swf", symbol="bg_scroll")] public const background : Class;
		
		// Protecteds
		protected var _updateables : Array = [];
		protected var _sceneContainer :  DisplayObjectContainer;
		protected var _backgroundContainer : Sprite;
		protected var _sceneSprite : Sprite;
		protected var _lastFrameTime : int;
		
		public function init(sceneContainer:DisplayObjectContainer) : void
		{
			_sceneContainer = sceneContainer;
					
			// First add the background
			_sceneContainer.addChild(new background());
			
			// Then add the continer for the rest of the sprites
			_sceneSprite = new Sprite();
			_sceneContainer.addChild(_sceneSprite);
			
			// Start listening for frame updates
			_sceneContainer.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			_lastFrameTime = getTimer();
		}			
		
		protected function onEnterFrame(event:Event) : void
		{
			var now : Number = getTimer();
			for each(var updateable:IUpdateable in _updateables)
			{
				updateable.update(now-_lastFrameTime);
			}
			_lastFrameTime = now;
		}
		
		public function registerForUpdates(updateable:IUpdateable) : void
		{
			_updateables.push(updateable);
		}
		
		public function unRegisterForUpdates(updateable:IUpdateable) : void
		{
			var indx : int = _updateables.indexOf(updateable);
			_updateables.splice(indx,1);
		}
		
		public function addChild(child:DisplayObject) : void
		{			
			_sceneSprite.addChild(child);
		}
		
		public function removeChild(child:DisplayObject) : void
		{			
			_sceneSprite.removeChild(child);
		}
		
		public function get stage() : Stage { return _sceneSprite.stage; }
	}
}