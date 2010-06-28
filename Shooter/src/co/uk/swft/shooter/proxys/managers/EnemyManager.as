package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.base.GameManager;
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.components.rendering.SpriteSheet;
	import co.uk.swft.shooter.entities.effects.AnimatedEffect;
	import co.uk.swft.shooter.entities.enemies.EnemyBase;
	import co.uk.swft.shooter.entities.enemies.FastEnemy;
	import co.uk.swft.shooter.entities.enemies.SlowEnemy;
	import co.uk.swft.shooter.proxys.assets.GameAssets;
	
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Actor;
	
	public class EnemyManager extends GameManager implements IUpdateable
	{
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var effects : EffectsManager;
		[Inject] public var resources : ResourceManager;
		
		// Protecteds
		protected var _enemySpawnTimeLimit : int;
		protected var _enemySpawnTimer : int=0;
		protected var _enemies : Array = [];
		
		override public function onGameStartup():void
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
			
			// Listen for some stuff
			enemy.onNoHP.add(function():void{dettonateEnemy(enemy)});
			enemy.onLeftScreen.add(function():void{removeEnemy(enemy)});
			
			// Add it to our list of enemies
			_enemies.push(enemy);				
		}
		
		public function removeEnemy(enemy:EnemyBase) : void
		{
			_enemies.splice(_enemies.indexOf(enemy),1);
			entityMap.removeEntity(enemy);
		}
		
		public function dettonateEnemy(enemy:EnemyBase) : void
		{
			// Spawn an explosion
			var effect : AnimatedEffect = effects.spawnEffect(AnimatedEffect);			
			effect.renderer.sheet = resources.getSpriteSheet(GameAssets.mediumExplosion);
			effect.renderer.targetFPS = 30; // slow it down to 30, 60 is too fast
			effect.spatial.position = enemy.spatial.position.clone();
			
			// Remove the enemy
			removeEnemy(enemy);
		}
	}
}