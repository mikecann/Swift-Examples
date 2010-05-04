package
{
	import co.uk.swft.shooter.ShooterContext;
	
	import flash.display.Sprite;
	
	[SWF(width="500", height="600", backgroundColor="#000000", frameRate="60")]
	public class Shooter extends Sprite
	{
		protected var context:ShooterContext;
		
		public function Shooter()
		{
			context = new ShooterContext(this);
		}
	}
}