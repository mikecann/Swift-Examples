package co.uk.swft.shooter.entities
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.shooter.components.implementation.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.implementation.Spatial2DComponent;
	import co.uk.swft.shooter.components.interfaces.ISpatial2DComponent;
	
	public class EnemyBase extends Entity
	{	
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		
		override public function mapComponents() : void
		{
			// Map components
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
		}
		
	}
}