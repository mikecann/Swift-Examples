package co.uk.mikecann.app.entities
{
	import co.uk.mikecann.app.components.CircleRendererComponent;
	import co.uk.mikecann.app.components.IShapeRenderer;
	import co.uk.mikecann.app.components.MouseFollowController;
	import co.uk.mikecann.app.components.SpatialComponent;
	import co.uk.mikecann.app.signals.SpawnRedCircleSignal;
	import co.uk.swft.base.Entity;
	
	public class BlueCircle extends Entity
	{
		// From GameContext
		[Inject] public var spawnRedCircle : SpawnRedCircleSignal;
		
		// Components
		[Inject] public var spatial : SpatialComponent;
		[Inject] public var renderer : IShapeRenderer;
		[Inject] public var controller : MouseFollowController;
		
		override public function mapComponents() : void
		{
			injector.mapSingleton(SpatialComponent);
			injector.mapSingletonOf(IShapeRenderer, CircleRendererComponent);
			injector.mapSingleton(MouseFollowController);
		}
		
		[PostConstruct]
		public function init() : void
		{
			renderer.colour = 0x0000ff;
			renderer.clicked.add( onClicked );
		}
		
		protected function onClicked() : void
		{
			spawnRedCircle.dispatch();      
		}
	}
}