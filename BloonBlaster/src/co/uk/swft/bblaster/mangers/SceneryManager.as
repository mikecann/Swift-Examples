package co.uk.swft.bblaster.mangers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.bblaster.entities.Scenery;
	
	public class SceneryManager extends GameManager
	{
		// protecteds
		protected var _bg : Scenery;
		
		override public function onGameStartup() : void
		{
			_bg = entityMap.createEntity(Scenery) as Scenery;
		}
		
		override public function onNextLevel() : void
		{
			// HOOK: Override this
		}
	}
}