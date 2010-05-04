package co.uk.swft.shooter.proxys.implementation
{
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.EnemyBase;
	import co.uk.swft.shooter.entities.FastEnemy;
	import co.uk.swft.shooter.entities.SlowEnemy;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
	import co.uk.swft.shooter.proxys.interfaces.IUpdateable;
	
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Actor;
	
	public class EnemyProxy extends Actor implements IUpdateable
	{
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var entityMap : IEntityMap;
		
		// Protecteds
		protected var _enemySpawnTimeLimit : int;
		protected var _enemySpawnTimer : int=0;
		protected var _enemies : Array = [];
		
		public function start() : void
		{
			_enemySpawnTimeLimit = 1000 + Math.random()*2000;
			scene.registerForUpdates(this);
		}
		
		public function update(deltaTime:int) : void
		{
			_enemySpawnTimer += deltaTime;
			if (_enemySpawnTimer>=_enemySpawnTimeLimit)
			{
				_enemySpawnTimer = 0;
				_enemySpawnTimeLimit = 1000 + Math.random()*2000;
				spawnEnemy();
			}
		}
		
		protected function spawnEnemy() : void
		{
			// Make a random type of enemy
			var enemyType : Class = Math.random()<0.5?SlowEnemy:FastEnemy;			
			var enemy : EnemyBase = entityMap.createEntity(enemyType) as EnemyBase;	
			
			// Set its position at the top of the screen
			enemy.spatial.position.x = Math.random()*scene.stage.stageWidth;
			enemy.spatial.position.y = -50;			
			
			// Add it to our list of enemies
			_enemies.push(enemy);		
		}
	}
}