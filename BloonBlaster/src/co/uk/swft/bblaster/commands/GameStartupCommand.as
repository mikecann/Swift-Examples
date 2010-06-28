package co.uk.swft.bblaster.commands
{
	import co.uk.swft.core.IGameManagerMap;
	import co.uk.swft.engine.managers.scene.IScene;
	
	import flash.display.Sprite;
	
	import net.hires.debug.Stats;
	
	import org.robotlegs.mvcs.Command;
	
	public class GameStartupCommand extends Command
	{			
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var managers : IGameManagerMap;
		
		override public function execute():void
		{
			// Eep! Cast
			var bbRoot : BloonBlaster = contextView as BloonBlaster;
			
			// Set the container for our scene
			scene.sceneContainer = bbRoot.gameLayer;
		
			// Add some onscreen stats
			bbRoot.statsLayer.addChild(new Stats());

			// Start the ball rolling
			managers.startGame();
			managers.startNextLevel();
		}
	}
}