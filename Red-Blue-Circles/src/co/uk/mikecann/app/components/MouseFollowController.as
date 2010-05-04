package co.uk.mikecann.app.components
{
	import co.uk.mikecann.app.scene.IUpdateable;
	import co.uk.mikecann.app.scene.Scene;
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.core.IEntityComponent;
	
	public class MouseFollowController implements IUpdateable, IEntityComponent
	{
		// Injecteds
		[Inject] public var scene : Scene; 
		[Inject] public var spatial : SpatialComponent;
		
		[PostConstruct]
		public function init() : void
		{
			// register us for updates
			scene.registerForUpdates(this);
		}	
		
		public function update() : void
		{
			// Follow the mouse scene position
			spatial.position.x += (scene.mouseX-spatial.position.x)/6;
			spatial.position.y += (scene.mouseY-spatial.position.y)/6;
		}
		
	}
}