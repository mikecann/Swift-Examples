package co.uk.swft.engine.components.collision
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.managers.CollisionManager;
	import co.uk.swft.shooter.proxys.managers.IScene;
	
	import org.osflash.signals.Signal;
	
	public class ColliderComponent extends EntityComponent implements ICollider
	{
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var manager : CollisionManager;
		
		// Protecteds
		protected var _collisionRadius : Number;
		protected var _onCollision : Signal = registerSignal(new Signal(ICollider));
		
		override public function onRegister():void
		{
			super.onRegister();
			manager.addCollidable(this);
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			manager.removeCollidable(this);
		}
		
		public function testCollidesWith(against:ICollider): Boolean
		{
			var dx : Number = against.centreX-centreX;
			var dy : Number = against.centreY-centreY;
			var dSqr : Number = (dx*dx)+(dy*dy);
			return dSqr<(collisionRadius*collisionRadius);
		}
		
		// Accessors
		public function set collisionRadius(value:Number):void{ _collisionRadius = value; }
		public function get collisionRadius() : Number { return _collisionRadius  }
		public function get centreX() : Number { return spatial.position.x; }
		public function get centreY() : Number { return spatial.position.y; }
		public function get onCollision() : Signal { return _onCollision; }
	}
}