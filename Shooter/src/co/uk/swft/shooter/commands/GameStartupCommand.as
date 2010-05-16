package co.uk.swft.shooter.commands
{
	import co.uk.swft.base.EntityMap;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.core.IGameManagerMap;
	import co.uk.swft.shooter.entities.bullets.Bullet;
	import co.uk.swft.shooter.entities.player.Player;
	import co.uk.swft.shooter.proxys.managers.BulletManager;
	import co.uk.swft.shooter.proxys.managers.CollisionManager;
	import co.uk.swft.shooter.proxys.managers.EffectsManager;
	import co.uk.swft.shooter.proxys.managers.EnemyManager;
	import co.uk.swft.shooter.proxys.managers.GameplayManager;
	import co.uk.swft.shooter.proxys.managers.IScene;
	import co.uk.swft.shooter.proxys.managers.ResourceManager;
	import co.uk.swft.shooter.proxys.managers.SceneManager;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	
	import net.hires.debug.Stats;
	
	import org.robotlegs.mvcs.Command;
	
	public class GameStartupCommand extends Command
	{			
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var managers : IGameManagerMap;
		
		override public function execute():void
		{
			// Set the container for our scene
			var s :Sprite = new Sprite();
			contextView.addChild(s);
			scene.sceneContainer = s;
		
			// Add some onscreen stats
			contextView.addChild(new Stats());

			// Start the ball rolling
			managers.startGame();
		}
	}
}