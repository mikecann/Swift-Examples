package co.uk.swft.shooter.components.implementation
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.shooter.components.interfaces.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
	import co.uk.swft.shooter.proxys.interfaces.IUpdateable;
	
	import org.osflash.signals.Signal;

	public class SpatialMovingController extends EntityComponent implements IUpdateable
	{		
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var spatial : ISpatial2DComponent;
		
		// Signals
		public var outsideArea : Signal = new Signal();
		
		override public function onRegister():void
		{
			scene.registerForUpdates(this);				
		}
		
		override public function onRemove():void
		{
			scene.unRegisterForUpdates(this);
		}
		
		public function update(frameDelta:int) : void
		{
			spatial.position.x += spatial.velocity.x*frameDelta;			
			spatial.position.y += spatial.velocity.y*frameDelta;
			
			if (spatial.position.x < 0 || spatial.position.x>scene.stage.stageWidth ||
				spatial.position.y < 0 || spatial.position.y>scene.stage.stageHeight )
			{
				outsideArea.dispatch();
			}
		}
		
	}	
}