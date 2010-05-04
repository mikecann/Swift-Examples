package co.uk.swft.shooter.commands
{
	import flash.geom.Point;
	
	import org.robotlegs.mvcs.Command;
	
	public class ShootBulletCommand extends Command
	{
		// Signal Params
		[Inject] public var bulletClass : Class;
		
		override public function execute():void
		{
			
		}
	}
}