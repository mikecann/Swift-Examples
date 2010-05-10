package co.uk.swft.shooter.entities.enemies
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.shooter.components.collision.ColliderComponent;
	import co.uk.swft.shooter.components.collision.ICollider;
	import co.uk.swft.shooter.components.other.HealthComponent;
	import co.uk.swft.shooter.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.components.spatial.Spatial2DComponent;
	import co.uk.swft.shooter.entities.bullets.Bullet;
	import co.uk.swft.shooter.entities.player.Player;
	
	import org.osflash.signals.Signal;
	
	public class EnemyBase extends Entity
	{	
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var collider : ICollider;
		[Inject] public var health : HealthComponent;
		
		// Signals
		public var onNoHP : Signal = new Signal();
		public var onLeftScreen : Signal = new Signal();
		
		override public function mapComponents() : void
		{
			// Map components
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
			injector.mapSingleton(HealthComponent);
			injector.mapSingletonOf(ICollider, ColliderComponent);
		}
		
		override public function onRegister():void
		{
			collider.onCollision.add( onCollision );
			health.onHPReachedMinimum.add( onNoHP.dispatch );
		}
		
		protected function onCollision(collidesWith:ICollider) : void
		{
			if (collidesWith.owner is Player){ health.changeHitpoints(-100000); }
			if (collidesWith.owner is Bullet)
			{
				var b : Bullet = collidesWith.owner as Bullet;
				health.changeHitpoints(-b.damage);
			}
		}
	}
}