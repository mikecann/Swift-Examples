package co.uk.swft.shooter.entities
{
	import co.uk.swft.shooter.components.implementation.SimpleEnemyController;

	public class FastEnemy extends EnemyBase
	{
		// Assets
		[Embed(source="assets/assets.swf", symbol="enemy_ship2")] public const shipGraphic : Class;	
		
		// Components
		[Inject] public var controller : SimpleEnemyController;
		
		override public function mapComponents() : void
		{
			super.mapComponents();
			injector.mapSingleton(SimpleEnemyController);
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			controller.outsideArea.add( onLeftArea );
			renderer.sprite = new shipGraphic();
			spatial.velocity.y = 0.3;
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			controller.outsideArea.remove(onLeftArea);
		}
		
		protected function onLeftArea() : void
		{
			entityMap.removeEntity(this);
		}
		
	}
}