package co.uk.swft.shooter.commands
{
	import co.uk.swft.base.EntityMap;
	import co.uk.swft.core.IEntityMap;
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
	import flash.ui.Mouse;
	
	import net.hires.debug.Stats;
	
	import org.robotlegs.mvcs.Command;
	
	public class GameStartupCommand extends Command
	{			
		// Actors
		[Inject] public var entityMap : IEntityMap;
		[Inject] public var scene : IScene;
		[Inject] public var enemies : EnemyManager;
		[Inject] public var collision : CollisionManager;
		[Inject] public var gameplay : GameplayManager;
		[Inject] public var resources : ResourceManager;
		[Inject] public var effects : EffectsManager;
		[Inject] public var bullets : BulletManager;
		
		override public function execute():void
		{
			// Start the game rolling
			resources.init();
			scene.init(contextView);
			enemies.init();			
			collision.init();
			gameplay.init();	
			effects.init();
			bullets.init();
			
			// Add some onscreen stats
			contextView.addChild(new Stats());

			// Hide the mouse
			Mouse.hide();
		}
	}
}