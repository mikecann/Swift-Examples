package co.uk.swft.shooter.entities.effects
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.shooter.components.animation.AnimatorComponent;
	import co.uk.swft.shooter.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.rendering.SpriteSheetRenderer;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.components.spatial.Spatial2DComponent;
	
	import org.osflash.signals.Signal;
	
	public class AnimatedEffect extends Entity
	{
		// Signals
		public var onEffectComplete : Signal = new Signal();
		
		// Components
		[Inject] public var renderer : SpriteSheetRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		
		override public function mapComponents():void
		{
			injector.mapSingleton(SpriteSheetRenderer);
			injector.mapSingletonOf(ISpatial2DComponent,Spatial2DComponent);
		}
		
		override public function onRegister():void
		{
			super.onRegister();	
			renderer.timesToPlay = 1;
			renderer.onAnimationComplete.add( onEffectComplete.dispatch );
		}	
	}
}