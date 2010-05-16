package co.uk.swft.shooter.components.controllers
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.managers.IScene;
	import co.uk.swft.shooter.proxys.managers.IUpdateable;
	
	import org.osflash.signals.Signal;

	public class SimpleEnemyController extends EntityComponent implements IUpdateable
	{		
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var spatial : ISpatial2DComponent;
		
		// Signals
		public var outsideArea : Signal = registerSignal(new Signal());
		
		override public function onRegister():void
		{
			super.onRegister();
			scene.registerForUpdates(this);				
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			scene.unRegisterForUpdates(this);
		}
		
		public function update(frameDelta:int) : void
		{
			spatial.position.x += spatial.velocity.x*frameDelta;			
			spatial.position.y += spatial.velocity.y*frameDelta;
			
			if (spatial.position.y>scene.stage.stageHeight)
			{
				outsideArea.dispatch();
			}
		}
	}
}