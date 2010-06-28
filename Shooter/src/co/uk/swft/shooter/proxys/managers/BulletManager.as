package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.bullets.Bullet;
	
	import flash.system.System;
	
	import org.robotlegs.mvcs.Actor;
	
	public class BulletManager extends GameManager
	{			
		// Protecteds
		protected var _bullets : Array;
		
		override public function onGameStartup():void
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
			entityMap.removeEntity(bullet);
		}
	}
}