package co.uk.mikecann.app.commands
{
	import co.uk.mikecann.app.entities.RedCircle;
	import co.uk.swft.base.GameCommand;
	
	public class SpawnRedCircleCommand extends GameCommand
	{		
		override public function execute() : void
		{
			var circle : RedCircle = entityMap.instantiateEntity(RedCircle) as RedCircle;
			circle.spatial.position.x = Math.random()*500;
			circle.spatial.position.y = Math.random()*500;
		}			
	}
}