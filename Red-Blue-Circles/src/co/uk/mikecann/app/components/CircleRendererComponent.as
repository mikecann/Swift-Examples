package co.uk.mikecann.app.components
{
	import co.uk.mikecann.app.scene.IUpdateable;
	import co.uk.mikecann.app.scene.Scene;
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.core.IEntityComponent;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class CircleRendererComponent implements IUpdateable, IShapeRenderer, IEntityComponent
	{
		// Injecteds
		[Inject] public var scene : Scene; 
		[Inject] public var spatial : SpatialComponent;
		
		// Protected
		protected var _sprite : Sprite;
		protected var _colour : uint = 0;
		protected var _clicked : Signal = new Signal();
		
		[PostConstruct]
		public function init() : void
		{
			// Make a sprite to render to and add it to the display list
			_sprite = new Sprite();		
			scene.addChild(_sprite);
			
			// Start updating
			scene.registerForUpdates(this);
			
			// We are interested in mouse clicks 
			_sprite.addEventListener(MouseEvent.CLICK, onClicked);
		}		
		
		public function update() : void
		{
			redrawCircle();
		}
		
		protected function redrawCircle() : void
		{
			// Draw the circle 
			_sprite.graphics.clear();
			_sprite.graphics.beginFill(colour);
			_sprite.graphics.drawCircle(spatial.position.x,spatial.position.y,40);
			_sprite.graphics.endFill();	
		}
		
		protected function onClicked(event:MouseEvent) : void { clicked.dispatch(); } 

		public function get colour():uint {	return _colour;	}
		public function set colour(value:uint):void { _colour = value; }
		public function get clicked() : Signal { return _clicked; }
	}
}