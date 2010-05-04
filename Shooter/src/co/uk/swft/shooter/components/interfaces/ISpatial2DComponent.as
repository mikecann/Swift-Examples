package co.uk.swft.shooter.components.interfaces
{
	import flash.geom.Point;

	public interface ISpatial2DComponent
	{
		function get position() : Point;
		function set position(p:Point) : void;
		function get velocity() : Point;
		function set velocity(p:Point) : void;
		
	}
}