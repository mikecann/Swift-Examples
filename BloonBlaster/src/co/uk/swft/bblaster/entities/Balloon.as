package co.uk.swft.bblaster.entities
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.bblaster.asssets.GameAssets;
	import co.uk.swft.bblaster.components.controller.BloonController;
	import co.uk.swft.engine.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.engine.components.spatial.ISpatial2DComponent;
	import co.uk.swft.engine.components.spatial.Spatial2DComponent;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class Balloon extends Entity
	{
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var controller : BloonController;
		
		// Signals
		public var popped : Signal = new Signal(Balloon);
		
		override public function mapComponents() : void
		{
			injector.mapSingleton(SimpleSpriteRenderer);
			injector.mapSingleton(BloonController);
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
		}
		
		override public function onRegister():void
		{
			// Get the bloon sprite from the assets lib
			var blueBloonClass : Class = GameAssets.blueBloon;
			var s : Sprite = new blueBloonClass();
			
			// Listen for when its clicked
			s.buttonMode = true;
			s.addEventListener(MouseEvent.CLICK, onBloonClicked, false, 0, true);
			
			// Set it to render
			renderer.sprite = s;	
		}
		
		protected function onBloonClicked(e:MouseEvent) : void
		{
			popped.dispatch(this);
		}	
	}
}