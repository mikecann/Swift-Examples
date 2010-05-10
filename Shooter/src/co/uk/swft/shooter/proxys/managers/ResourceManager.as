package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.shooter.components.rendering.SpriteSheet;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * This class should handle loading from URLs too but for now
	 * ill just embed everything 
	*/
	public class ResourceManager extends Actor
	{				
		// Protecteds
		protected var _resourceCache : Dictionary;
		
		public function init() : void			
		{
			_resourceCache = new Dictionary();
		}
				
		public function getSprite(source:Class) : Sprite
		{
			return new source();			
		}
		
		public function getSpriteSheet(source:Class) : SpriteSheet
		{
			if (!_resourceCache[source]){ _resourceCache[source] = new SpriteSheet(new source()); }
			return _resourceCache[source];			
		}		
		
		
	}
}