package co.uk.mikecann.app.scene
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Scene extends Sprite
	{
		// Protecteds
		protected var _updateables : Vector.<IUpdateable>;
		
		public function Scene()
		{
			_updateables = new Vector.<IUpdateable>();
			addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		protected function onFrame(event:Event) : void
		{
			for each (var updateable : IUpdateable in _updateables)
			{
				updateable.update();
			}
		}
		
		public function registerForUpdates(updateable:IUpdateable) : void
		{
			_updateables.push(updateable);
		}
	}
}