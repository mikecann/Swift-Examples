package co.uk.swft.engine.components.common
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.engine.managers.scene.IScene;
	import co.uk.swft.engine.managers.scene.IUpdateable;
	
	public class UpdateableEntityComponent extends EntityComponent implements IUpdateable
	{		
		// Dependencies
		[Inject] public var scene : IScene;
		
		override public function onRegister():void
		{
			scene.registerForUpdates(this);
		}
		
		public function update(frameDelta:int) : void
		{			
		}
		
		override public function onRemove():void
		{
			scene.unRegisterForUpdates(this);
		}
	}
}