package co.uk.swft.engine.components.rendering
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.engine.components.spatial.ISpatial2DComponent;
	import co.uk.swft.engine.managers.scene.IScene;
	import co.uk.swft.engine.managers.scene.IUpdateable;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class SimpleSpriteRenderer extends EntityComponent implements IUpdateable
	{
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var spatial : ISpatial2DComponent;
		
		// Protecteds
		protected var _sprite : DisplayObject;
		
		override public function onRegister():void
		{
			super.onRegister();
			scene.registerForUpdates(this);				
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			scene.unRegisterForUpdates(this);
			sprite = null;
		}

		public function update(frameDelta:int) : void
		{
			// If no sprite set than we cant do anything 
			if (sprite==null){ return; }
			
			// Set the position of the sprite
			sprite.x = spatial.position.x;
			sprite.y = spatial.position.y;
		}
		
		public function get sprite():DisplayObject { return _sprite; }		
		public function set sprite(value:DisplayObject):void
		{
			if (_sprite!=null){ scene.removeChild(_sprite); }
			_sprite = value;
			if (_sprite!=null) { scene.addChild(_sprite); }
		}
	}
}