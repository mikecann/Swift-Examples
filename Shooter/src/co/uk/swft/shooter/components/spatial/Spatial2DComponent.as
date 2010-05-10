package co.uk.swft.shooter.components.spatial
{
	import co.uk.swft.base.EntityComponent;
	
	import flash.geom.Point;
	
	public class Spatial2DComponent extends EntityComponent implements ISpatial2DComponent
	{
		// protecteds
		protected var _position:Point;
		protected var _velocity:Point;
		
		override public function onRegister():void
		{
			_position = new Point();
			_velocity = new Point();
		}
		
		public function get position():Point
		{
			return _position;
		}
		
		public function set position(p:Point):void
		{
			_position = p;
		}
		
		public function get velocity():Point
		{
			return _velocity;
		}
		
		public function set velocity(p:Point):void
		{
			_velocity = p;
		}
	}
}