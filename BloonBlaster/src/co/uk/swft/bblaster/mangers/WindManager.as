package co.uk.swft.bblaster.mangers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.engine.managers.scene.IScene;
	import co.uk.swft.engine.managers.scene.IUpdateable;
	
	import flash.geom.Point;
	
	public class WindManager extends GameManager implements IUpdateable
	{
		// Dependencies
		[Inject] public var scene : IScene;
		
		// Publics
		public var windVector : Point;
		
		// Protecteds
		protected var _timeSinceLastWindChange : int;
		protected var _timeTillNextWindChange : int;
		
		override public function onGameStartup():void
		{
			scene.registerForUpdates(this);
		}
		
		override public function onNextLevel():void
		{		
			windVector = getNewWindVector();
			_timeSinceLastWindChange = 0;
			_timeTillNextWindChange = getNextWindChangeTime();
		}
		
		public function update(frameDelta:int) : void
		{
			_timeSinceLastWindChange += frameDelta;
			if(_timeSinceLastWindChange > _timeTillNextWindChange)
			{
				_timeSinceLastWindChange = 0;
				_timeTillNextWindChange = getNextWindChangeTime();
				windVector = getNewWindVector();
			}
		}
		
		protected function getNextWindChangeTime() : int { return 3000+(Math.random()*2000); }
		
		protected function getNewWindVector() : Point
		{
			var p : Point = new Point();
			p.x = -1+Math.random()*2;
			p.y = -1+Math.random()*2;
			return p;
		}
	}
}