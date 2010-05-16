package co.uk.swft.shooter.entities.enemies
{
	import co.uk.swft.shooter.components.controllers.SimpleEnemyController;
	import co.uk.swft.shooter.proxys.assets.GameAssets;
	import co.uk.swft.shooter.proxys.managers.ResourceManager;
	
	public class SlowEnemy extends EnemyBase
	{
		// Dependencies
		[Inject] public var resources : ResourceManager;
		
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
			renderer.sprite = resources.getSprite(GameAssets.slowEnemyShip);
			collider.collisionRadius = renderer.sprite.width;
			controller.outsideArea.add(onLeftScreen.dispatch);
			spatial.velocity.y = 0.1;
			health.initValues(0,200,200);
		}
		
	}
}