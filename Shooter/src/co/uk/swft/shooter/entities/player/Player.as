package co.uk.swft.shooter.entities.player
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.base.EntityMap;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.components.collision.ColliderComponent;
	import co.uk.swft.shooter.components.collision.ICollider;
	import co.uk.swft.shooter.components.controllers.PlayerController;
	import co.uk.swft.shooter.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.components.spatial.Spatial2DComponent;
	import co.uk.swft.shooter.entities.bullets.Bullet;
	import co.uk.swft.shooter.entities.enemies.EnemyBase;
	import co.uk.swft.shooter.proxys.assets.GameAssets;
	import co.uk.swft.shooter.proxys.managers.BulletManager;
	import co.uk.swft.shooter.proxys.managers.IScene;
	import co.uk.swft.shooter.proxys.managers.ResourceManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import org.osflash.signals.Signal;
	
	public class Player extends Entity
	{		
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var resources : ResourceManager;
		[Inject] public var bullets : BulletManager;
		
		// Signals
		public var onHitByEnemy : Signal = new Signal();
		
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var controller : PlayerController;
		[Inject] public var collider : ICollider;
		
		override public function mapComponents() : void
		{
			// Map components
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
			injector.mapSingleton(PlayerController);
			injector.mapSingletonOf(ICollider,ColliderComponent);
		}
		
		override public function onRegister():void
		{
			renderer.sprite = resources.getSprite(GameAssets.playerShip);
			
			controller.shootBullet.add( onShootBullet );
			
			collider.collisionRadius = renderer.sprite.width;
			collider.onCollision.add(onCollision);		
		}
			
		protected function onShootBullet() : void
		{
			var b : Bullet = bullets.spawnBullet();
			b.spatial.position.x = spatial.position.x - renderer.sprite.width/2 + 10;
			b.spatial.position.y = spatial.position.y;
			b.spatial.velocity.y = -0.5;
			b.renderer.sprite = resources.getSprite(GameAssets.playerBullet);	
			
			b = bullets.spawnBullet();
			b.spatial.position.x = spatial.position.x + renderer.sprite.width/2 - 10;
			b.spatial.position.y = spatial.position.y;
			b.spatial.velocity.y = -0.5;
			b.renderer.sprite = resources.getSprite(GameAssets.playerBullet);
		}
		
		protected function onCollision(collidesWith:ICollider) : void
		{
			if (collidesWith.owner is EnemyBase)
			{
				onHitByEnemy.dispatch();
			}
		}
		
		
	}
}