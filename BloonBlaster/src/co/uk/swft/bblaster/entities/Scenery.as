package co.uk.swft.bblaster.entities
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.bblaster.asssets.GameAssets;
	import co.uk.swft.engine.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.engine.components.spatial.ISpatial2DComponent;
	import co.uk.swft.engine.components.spatial.Spatial2DComponent;
	
	public class Scenery extends Entity
	{
		// Components
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var renderer : SimpleSpriteRenderer;
		
		override public function mapComponents():void
		{
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
		}
		
		override public function onRegister():void
		{
			var c : Class = GameAssets.gameBG;
			renderer.sprite = new c();
			renderer.sprite.cacheAsBitmap = true;
		}	
	}
}