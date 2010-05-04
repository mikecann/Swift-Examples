package co.uk.mikecann.app
{
	import co.uk.mikecann.app.commands.SpawnRedCircleCommand;
	import co.uk.mikecann.app.entities.BlueCircle;
	import co.uk.mikecann.app.entities.RedCircle;
	import co.uk.mikecann.app.scene.Scene;
	import co.uk.mikecann.app.signals.SpawnRedCircleSignal;
	import co.uk.swft.base.GameContext;
	
	import flash.display.Sprite;
	
	import mx.core.UIComponent;
	
	public class CirclesContext extends GameContext
	{		
		// publics
		public var sceneLayer : UIComponent;
		
		// protecteds
		protected var _blueCircle : BlueCircle;
		protected var _scene : Scene;		
				
		override public function startup():void
		{					
			// Making the scene
			_scene = new Scene();
			sceneLayer.addChild(_scene);
			
			// Map the scene for use by the entities and components
			injector.mapValue(Scene, _scene);		
			
			// Map some commands
			signalCommandMap.mapSignalClass(SpawnRedCircleSignal, SpawnRedCircleCommand);
			
			// Now make a blue circle that follows the mouse about
			_blueCircle = entityMap.instantiateEntity(BlueCircle) as BlueCircle;
		}
	}
}