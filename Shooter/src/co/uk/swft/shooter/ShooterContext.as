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
	
	public class ShooterContext extends GameContext
	{
		public function ShooterContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			// Map some managers
			injector.mapSingletonOf(IScene,SceneManager);
			injector.mapSingleton(EnemyManager);
			injector.mapSingleton(CollisionManager);
			injector.mapSingleton(GameplayManager);
			injector.mapSingleton(EffectsManager);
			injector.mapSingleton(ResourceManager);
			injector.mapSingleton(BulletManager);
			
			// Start the ball rolling
			(signalCommandMap.mapSignalClass(GameStartupSignal, GameStartupCommand, true) as GameStartupSignal).dispatch();
		}		
	}
}