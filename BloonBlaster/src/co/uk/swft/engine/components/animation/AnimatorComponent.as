package co.uk.swft.engine.components.animation
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.shooter.proxys.managers.IScene;
	import co.uk.swft.shooter.proxys.managers.IUpdateable;
	
	import org.osflash.signals.Signal;
	
	/**
	 * WARNING, CLASS NOT FINISHED!!
	 * 
	 * I was experimenting with having an Animator simmilar to the PBE one and realised it 
	 * was probably unneccessary and performance wise the targetObject[targetProperty] lookup
	 * probably isnt a good idea when used for every single animation in the game. Instead
	 * I baked animation ability into the SpriteSheetRenderer.
	 * - MikeC 09/05/10
	 */
	/*public class AnimatorComponent extends EntityComponent implements IUpdateable
	{
		// Anim Types
		public static const LOOP : int = 0;
		
		// Dependencies
		[Inject] public var scene : IScene;
		
		// Signals
		public var onAnimationComplete : Signal = new Signal();
		
		// Publics
		public var targetObject : Object;
		public var targetProperty : String;
		public var animationType : int;
		public var animationTime : int;
		public var timesToRepeat : int = -1;
		public var fromValue : Number = 0;
		public var toValue : Number = 1;
		
		// Protecteds		
		protected var _isAnimating : Boolean;
		protected var _animationTimer : int;
		protected var _repeatCounter : int;
		
		public function startAnimation() : void
		{
			// Cant animate if already animating
			if (_isAnimating) { return; }
			
			_animationTimer = 0;
			_repeatCounter = 0;
			scene.registerForUpdates(this);
		}
		
		public function update(frameDelta:int) : void
		{
			_animationTimer += frameDelta;				
			
			var counts : int = _animationTimer / animationTime;	
			if (counts>0)
			{
				_animationTimer -= counts*animationTime;			
				_repeatCounter += counts;
			}
			else
			{			
				interpolate();
			}						
		}	
		
		protected function interpolate() : void
		{
			if (animationType==LOOP)
			{
				targetObject[targetProperty] = fromValue+((toValue-fromValue)*ratio);				
			}
		}		
	}*/
}