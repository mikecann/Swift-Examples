package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.player.Player;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GameplayManager extends Actor
	{
		// Dependencies
		[Inject] public var entityMap : IEntityMap;
		
		// Protecteds
		protected var _player : Player;
		
		public function init() : void
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