package co.uk.mikecann.app.entities
{
	import co.uk.mikecann.app.components.CircleRendererComponent;
	import co.uk.mikecann.app.components.IShapeRenderer;
	import co.uk.mikecann.app.components.SpatialComponent;
	import co.uk.swft.base.Entity;
	
	public class RedCircle extends Entity
	{
		// Components
		[Inject] public var spatial : SpatialComponent;
		[Inject] public var renderer : IShapeRenderer;
		
		override public function mapComponents() : void
		{
			injector.mapSingleton(SpatialComponent);
			injector.mapSingletonOf(IShapeRenderer,CircleRendererComponent);	
		}
		
		[PostConstruct]
		public function init() : void
		{
			renderer.colour = 0xff0000;
		}
	}
}