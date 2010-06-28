package co.uk.swft.bblaster.mangers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.bblaster.components.controller.BloonController;
	import co.uk.swft.bblaster.entities.Balloon;
	
	import flash.geom.Point;
	
	public class BloonManager extends GameManager
	{		
		// Dependencies
		[Inject] public var scores : ScoreManager;
		
		// Protectes
		protected var _bloons : Array;
		
		override public function onGameStartup():void
		{
			_bloons = [];
		}
		
		override public function onNextLevel():void
		{
			for (var i:int=0; i<20; i++)
			{
				var b : Balloon = entityMap.createEntity(Balloon) as Balloon;
				b.spatial.position.x = Math.random()*500;
				b.spatial.position.y = Math.random()*600;
				b.popped.add(onBloonPopped);
				_bloons.push(b);
			}
		}		
		
		protected function onBloonPopped(bloon:Balloon) : void
		{					
			// Increment the score for this pop
			scores.changeScore(1);
			
			// Blow the baloons away from this pop
			explodeBloonsAway(bloon.spatial.position, 200, 0.03);
			
			// Remove the baloon from the list
			_bloons.splice(_bloons.indexOf(bloon),1);
			entityMap.removeEntity(bloon);	
		}
		
		protected function explodeBloonsAway(fromPoint:Point, range:Number, force:Number) : void			
		{			
			var rangeSq : Number = range*range;
			
			for each (var b : Balloon in _bloons)
			{
				var dx : Number = b.spatial.position.x-fromPoint.x;
				var dy : Number = b.spatial.position.y-fromPoint.y;
				var distSq : Number = (dx*dx)+(dy*dy);
				if (distSq < rangeSq)
				{
					var ratio : Number = 1 - (( distSq / rangeSq)*( distSq / rangeSq));
					b.spatial.velocity.x += dx * ratio * force;
					b.spatial.velocity.y += dy * ratio * force;
				}				
			}
		}
	}
}