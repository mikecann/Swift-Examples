package co.uk.swft.shooter.entities.bullets
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.shooter.components.collision.ColliderComponent;
	import co.uk.swft.shooter.components.collision.ICollider;
	import co.uk.swft.shooter.components.controllers.SpatialMovingController;
	import co.uk.swft.shooter.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.components.spatial.Spatial2DComponent;
	import co.uk.swft.shooter.entities.enemies.EnemyBase;
	import co.uk.swft.shooter.entities.player.Player;
	
	import org.osflash.signals.Signal;
	
	public class Bullet extends Entity
	{		
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var controller : SpatialMovingController;
		[Inject] public var collider : ICollider;
		
		// Publics
		public var damage : int = 20;
		
		// Signals
		public var onReadyForDestroy : Signal = new Signal();
		
		override public function mapComponents() : void
		{
			// Map components
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingletonOf(ICollider, ColliderComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
			injector.mapSingleton(SpatialMovingController);
		}
		
		override public function onRegister():void
		{
			controller.outsideArea.add( onReadyForDestroy.dispatch );
			collider.onCollision.add( onCollision );
		}	
		
		protected function onCollision(collidesWith:ICollider) : void
		{
			if (collidesWith.entity is Player) { return; }
			onReadyForDestroy.dispatch();
		}
		
	}
}