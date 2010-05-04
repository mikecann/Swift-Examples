package co.uk.mikecann.app.components
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.core.IEntityComponent;
	
	import flash.geom.Point;
	
	public class SpatialComponent implements IEntityComponent
	{
		// Publics
		public var position : Point;
		
		[PostConstruct]
		public function init() : void
		{
			position = new Point();
		}
	}
}