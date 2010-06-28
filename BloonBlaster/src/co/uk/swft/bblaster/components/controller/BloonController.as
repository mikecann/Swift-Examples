package co.uk.swft.bblaster.components.controller
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.bblaster.mangers.WindManager;
	import co.uk.swft.engine.components.common.UpdateableEntityComponent;
	import co.uk.swft.engine.components.rendering.SimpleSpriteRenderer;
	import co.uk.swft.engine.components.spatial.ISpatial2DComponent;
	import co.uk.swft.engine.components.spatial.Spatial2DComponent;
	import co.uk.swft.engine.managers.scene.IScene;
	
	public class BloonController extends UpdateableEntityComponent
	{
		// Consts
		public static const LEFT : int = -1;
		public static const RIGHT : int = 1;
		
		// Dependencies
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var wind : WindManager;
		
		// Protecteds
		protected var _oscillator : Number=Math.random()*50; 	
		
		override public function update(frameDelta:int):void
		{
			// Update the velocity based on the wind
			spatial.velocity.x += (wind.windVector.x*(frameDelta/500));
			spatial.velocity.y += (wind.windVector.y*(frameDelta/500));
			
			// Update the position based on a factor of the frame delta (to keep the positional updates constant)
			spatial.position.x += (spatial.velocity.x*(frameDelta/10));
			spatial.position.y += (spatial.velocity.y*(frameDelta/10));
			
			// Add air resistance
			spatial.velocity.x *= 0.95;
			spatial.velocity.y *= 0.95;
			
			// Now oscillate some
			_oscillator += frameDelta/500;
			spatial.position.y += Math.sin(_oscillator) * 1;
						
			// Now wrap the baloon if it goes off the screen edges
			wrapBloonToScreen();
		}
		
		protected function wrapBloonToScreen() : void
		{
			var spriteHW : Number = renderer.sprite.width/2;
			var stageW : Number = scene.stage.stageWidth;
			var spriteHH : Number = renderer.sprite.height/2;
			var stageH : Number = scene.stage.stageHeight;
			if (spatial.position.x<-spriteHW){ spatial.position.x=stageW+spriteHW; }
			else if (spatial.position.x>stageW+spriteHW){ spatial.position.x=-spriteHW; }
			if (spatial.position.y<-spriteHH){ spatial.position.y=stageH+spriteHH; }
			else if (spatial.position.y>stageH+spriteHH){ spatial.position.y=-spriteHH; }
		}
	}
}