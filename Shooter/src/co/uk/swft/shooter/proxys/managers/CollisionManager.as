package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.shooter.components.collision.ICollider;
	
	import org.robotlegs.mvcs.Actor;
	
	public class CollisionManager extends GameManager implements IUpdateable
	{
		// Dependencies
		[Inject] public var scene : IScene;
		
		// Protecteds
		protected var _collidables : Array;
		
		override public function onGameStartup():void
		{
			_collidables = [];
			scene.registerForUpdates(this);
		}
		
		public function addCollidable(collidable:ICollider) : void
		{
			_collidables.push(collidable);	
		}
		
		public function removeCollidable(collidable:ICollider) : void
		{
			_collidables.splice(_collidables.indexOf(collidable),1);
		}
		
		public function update(frameDelta:int) : void
		{
			for each (var colA : ICollider in _collidables)
			{
				for each (var colB : ICollider in _collidables)
				{
					if (colA!=colB)
					{
						if (colA.testCollidesWith(colB))
						{
							colA.onCollision.dispatch(colB);
							colB.onCollision.dispatch(colA);
						}
					}
				}
			}
		}
	}
}