package co.uk.swft.engine.components.spatial
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