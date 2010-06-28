package co.uk.swft.engine.managers.scene
{	
	import co.uk.swft.base.Entity;
	import co.uk.swft.base.GameManager;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SceneManager extends GameManager implements IScene
	{			
		// Protecteds
		protected var _updateables : Array = [];
		protected var _sceneContainer :  DisplayObjectContainer;
		protected var _sceneSprite : Sprite;
		protected var _lastFrameTime : int;

		override public function onGameStartup():void
		{			
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
		
		override public function get priority() : int { return 9; }
		
		public function get stage() : Stage { return _sceneSprite.stage; }
		
		public function get sceneContainer() : DisplayObjectContainer { return _sceneContainer; }
		public function set sceneContainer(value:DisplayObjectContainer) : void { _sceneContainer=value; }
	}
}