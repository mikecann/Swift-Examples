package co.uk.swft.shooter.components.rendering
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class SpriteSheetFrame
	{		
		// Protecteds			
		protected var _bmd : BitmapData=null;
		protected var _centreOffset : Point=null;
		protected var _scaleX : Number = 1;
		protected var _scaleY : Number = 1;
		protected var _transparrent : Boolean = true;
		protected var _bgColour : uint = 0;
		
		public function SpriteSheetFrame(mc:MovieClip, frameIndx:int)
		{
			// Recurrsively advance mc to the index of this frame
			mc.gotoAndStop(frameIndx+1);
			advanceChildClips(mc,frameIndx+1);	
			
			// Now render
			renderFrame(mc);
		}		
		
		protected function advanceChildClips(parent:MovieClip, frame:int):void
		{
			for (var j:int=0; j<parent.numChildren; j++)
			{
				var mc:MovieClip = parent.getChildAt(j) as MovieClip;
				if(!mc)
					continue;
				
				if (mc.totalFrames >= frame)
					mc.gotoAndStop(frame);
				else
					mc.gotoAndStop(mc.totalFrames);
				
				advanceChildClips(mc, frame);
			}
		}
		
		protected function renderFrame(mc:MovieClip):void 
		{			
			// Work out the bounds of this mc
			var b : Rectangle = mc.getBounds(mc);
			
			// Make a matrix for the draw
			var m : Matrix = new Matrix();
			m.scale(_scaleX, _scaleY);
			m.translate( 1 - b.x * _scaleX, 1 - b.y * _scaleY);	
			
			// Make the BMD and draw
			_bmd = new BitmapData( 2+b.width*_scaleX, 2+ b.height*_scaleY, _transparrent, _bgColour);
			_bmd.draw(mc,m);
			
			// Record the centre point offset for this frame
			_centreOffset = new Point( m.tx, m.ty);
		}		
		
		public function get bmd() : BitmapData { return _bmd; }
		public function get centreOffset() : Point { return _centreOffset; }
	}
}