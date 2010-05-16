package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.player.Player;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GameplayManager extends GameManager
	{
		// Dependencies
		[Inject] public var entityMap : IEntityMap;
		
		// Protecteds
		protected var _player : Player;
		
		override public function onGameStartup():void
		{
			// Make the player
			_player = entityMap.createEntity(Player) as Player;
			_player.onHitByEnemy.add( onPlayerHitByEnemy );
		}
		
		protected function onPlayerHitByEnemy() : void
		{
			
		}
	}
}