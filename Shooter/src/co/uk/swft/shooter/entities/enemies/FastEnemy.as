package co.uk.swft.shooter.entities.enemies
{
	import co.uk.swft.shooter.components.controllers.SimpleEnemyController;
	import co.uk.swft.shooter.proxys.assets.GameAssets;
	import co.uk.swft.shooter.proxys.managers.ResourceManager;

	public class FastEnemy extends EnemyBase
	{
		// Dependencies
		[Inject] public var resources : ResourceManager;
		
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
			controller.outsideArea.add( onLeftScreen.dispatch );
			renderer.sprite = resources.getSprite(GameAssets.fastEnemyShip);
			collider.collisionRadius = renderer.sprite.width;
			spatial.velocity.y = 0.3;
			health.initValues(0,100,100);
		}
		
	}
}