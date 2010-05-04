package co.uk.swft.shooter
{
	import co.uk.swft.base.GameContext;
	import co.uk.swft.shooter.commands.GameStartupCommand;
	import co.uk.swft.shooter.proxys.implementation.EnemyProxy;
	import co.uk.swft.shooter.proxys.implementation.Scene;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
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
			// Map some singletons
			injector.mapSingletonOf(IScene,Scene);
			injector.mapSingleton(EnemyProxy);
			
			// Start the ball rolling
			(signalCommandMap.mapSignalClass( GameStartupSignal, GameStartupCommand, true) as GameStartupSignal).dispatch();
		}		
	}
}