package co.uk.swft.shooter.entities
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.shooter.components.implementation.SpatialMovingController;
	import co.uk.swft.shooter.components.implementation.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.implementation.Spatial2DComponent;
	import co.uk.swft.shooter.components.interfaces.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
	
	public class Bullet extends Entity
	{		
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var controller : SpatialMovingController;
		
		override public function mapComponents() : void
		{
			// Map components
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
			injector.mapSingleton(SpatialMovingController);
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			controller.outsideArea.add( onBulletOutside );
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			controller.outsideArea.remove( onBulletOutside );
		}
		
		protected function onBulletOutside() : void
		{
			entityMap.removeEntity(this);
		}
		
	}
}