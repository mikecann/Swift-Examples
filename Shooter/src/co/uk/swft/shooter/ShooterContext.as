package co.uk.swft.shooter
{
	import co.uk.swft.base.GameContext;
	import co.uk.swft.shooter.commands.GameStartupCommand;
	import co.uk.swft.shooter.proxys.managers.BulletManager;
	import co.uk.swft.shooter.proxys.managers.CollisionManager;
	import co.uk.swft.shooter.proxys.managers.EffectsManager;
	import co.uk.swft.shooter.proxys.managers.EnemyManager;
	import co.uk.swft.shooter.proxys.managers.GameplayManager;
	import co.uk.swft.shooter.proxys.managers.IScene;
	import co.uk.swft.shooter.proxys.managers.ResourceManager;
	import co.uk.swft.shooter.proxys.managers.SceneManager;
	import co.uk.swft.shooter.signals.GameStartupSignal;
	
	import flash.display.DisplayObjectContainer;
	import flash.ui.Mouse;
	
	public class ShooterContext extends GameContext
	{
		public function ShooterContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			// No Mouse for this game
			Mouse.hide();
			
			// Map some managers
			gameManagerMap.mapManagerOf(IScene,SceneManager);
			gameManagerMap.mapManager(EnemyManager);
			gameManagerMap.mapManager(CollisionManager);
			gameManagerMap.mapManager(GameplayManager);
			gameManagerMap.mapManager(EffectsManager);
			gameManagerMap.mapManager(ResourceManager);
			gameManagerMap.mapManager(BulletManager);
			
			// Start the ball rolling
			(signalCommandMap.mapSignalClass(GameStartupSignal, GameStartupCommand, true) as GameStartupSignal).dispatch();
		}		
	}
}