package co.uk.swft.shooter.commands
{
	import co.uk.swft.base.EntityMap;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.Player;
	import co.uk.swft.shooter.proxys.implementation.EnemyProxy;
	import co.uk.swft.shooter.proxys.implementation.Scene;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
	
	import flash.display.DisplayObjectContainer;
	import flash.ui.Mouse;
	
	import net.hires.debug.Stats;
	
	import org.robotlegs.mvcs.Command;
	
	public class GameStartupCommand extends Command
	{			
		// Actors
		[Inject] public var scene : IScene;
		[Inject] public var game : EnemyProxy;
		[Inject] public var entityMap : IEntityMap;
		
		override public function execute():void
		{
			// Start the game rolling
			scene.start(contextView);
			game.start();			
						
			// Add some onscreen stats
			contextView.addChild(new Stats());
			
			// Make the player
			entityMap.createEntity(Player);
			
			// Hide the mouse
			Mouse.hide();
		}
	}
}