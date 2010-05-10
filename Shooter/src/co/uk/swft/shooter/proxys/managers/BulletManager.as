package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.bullets.Bullet;
	
	import org.robotlegs.mvcs.Actor;
	
	public class BulletManager extends Actor
	{		
		// Dependencies
		[Inject] public var entityMap : IEntityMap;
		
		// Protecteds
		protected var _bullets : Array;
		
		public function init() : void
		{
			_bullets = [];
		}
		
		public function spawnBullet() : Bullet
		{		
			var b : Bullet = entityMap.createEntity(Bullet) as Bullet;
			b.onReadyForDestroy.add( function():void{ removeBullet(b) } );
			_bullets.push(b);
			return b;
		}
		
		public function removeBullet(bullet:Bullet) : void
		{
			_bullets.splice(_bullets.indexOf(bullet),1);
			bullet.onRemove();
		}
	}
}