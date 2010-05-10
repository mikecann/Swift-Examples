package co.uk.swft.shooter.components.collision
{
	import co.uk.swft.core.IEntityComponent;
	
	import org.osflash.signals.Signal;

	public interface ICollider extends IEntityComponent
	{
		function get centreX() : Number;
		function get centreY() : Number;
		function set collisionRadius(value:Number) : void;
		function get collisionRadius() : Number;
		function testCollidesWith(against:ICollider): Boolean;
		function get onCollision() : Signal;
	}
}