package co.uk.swft.shooter.entities
{
	import co.uk.swft.shooter.components.implementation.SimpleEnemyController;
	
	public class SlowEnemy extends EnemyBase
	{
		// Assets
		[Embed(source="assets/assets.swf", symbol="enemy_ship1")]
		public const shipGraphic:Class;
		
		// Components
		[Inject] public var controller:SimpleEnemyController;
		
		override public function mapComponents():void
		{
			super.mapComponents();
			injector.mapSingleton(SimpleEnemyController);
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			renderer.sprite = new shipGraphic();
			controller.outsideArea.add(onLeftArea);
			spatial.velocity.y = 0.1;
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			controller.outsideArea.remove(onLeftArea);
		}
		
		protected function onLeftArea():void
		{
			entityMap.removeEntity(this);
		}
		
	}
}