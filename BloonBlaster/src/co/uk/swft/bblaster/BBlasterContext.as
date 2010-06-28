package co.uk.swft.bblaster
{
	import co.uk.swft.base.GameContext;
	import co.uk.swft.bblaster.commands.GameStartupCommand;
	import co.uk.swft.bblaster.mangers.BloonManager;
	import co.uk.swft.bblaster.mangers.SceneryManager;
	import co.uk.swft.bblaster.mangers.ScoreManager;
	import co.uk.swft.bblaster.mangers.WindManager;
	import co.uk.swft.bblaster.signals.GameStartupSignal;
	import co.uk.swft.bblaster.view.components.GameHUD;
	import co.uk.swft.bblaster.view.mediators.GameHUDMediator;
	import co.uk.swft.engine.managers.scene.IScene;
	import co.uk.swft.engine.managers.scene.SceneManager;
	
	import flash.display.DisplayObjectContainer;

	public class BBlasterContext extends GameContext
	{
		/*
		-----------------
		----- NOTES -----
		-----------------		
		- Managers
		- - Are managers the right idea? Should everthing just be components?
		- - How much game specific functionaly should be in managers? Next Level etc?
		- - Should managers dispatch signals for other managers to listen for? Or should they just call the manager? Or Commands?
		
		- Controllers
		- - Where exactly does the control lie? Which level should do what?
		- - Should controllers own more control? Does that make entities just public facades to the controller?
		
		- Engine
		- - Does there nee to be a SWFt engine / core somewhere? So we can reuse components
		*/
		
		public function BBlasterContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			// Map view / mediators
			mediatorMap.mapView(GameHUD, GameHUDMediator);
			
			// Map some managers
			gameManagerMap.mapManagerOf(IScene,SceneManager);
			gameManagerMap.mapManager(BloonManager);
			gameManagerMap.mapManager(ScoreManager);
			gameManagerMap.mapManager(SceneryManager);
			gameManagerMap.mapManager(WindManager);
					
			// Start the ball rolling
			(signalCommandMap.mapSignalClass(GameStartupSignal, GameStartupCommand, true) as GameStartupSignal).dispatch();
		}
	}
}