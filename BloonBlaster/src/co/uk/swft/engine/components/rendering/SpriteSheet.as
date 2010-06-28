package co.uk.swft.engine.components.rendering
{
	import flash.display.MovieClip;

	public class SpriteSheet
	{
		// protecteds
		protected var _frames : Array;		
		protected var _mc : MovieClip;
		protected var _frameCount : int;
		
		public function SpriteSheet(mc:MovieClip)
		{
			generateFromMC(mc);
		}		
		
		protected function generateFromMC(mc:MovieClip) : void
		{	
			_mc = mc;
			_mc.stop(); // Anoying clips playing automatically sometimes
			
			_frameCount = findMaxFrames(_mc,_mc.totalFrames);
			_frames = new Array(_frameCount);			
		}	
		
		public function getFrame(frameIndex:int) : SpriteSheetFrame
		{
			if (frameIndex<0){ return null; }
			if (frameIndex>_frameCount){ return null; }			
			if (_frames[frameIndex]==null){ _frames[frameIndex] = new SpriteSheetFrame(_mc,frameIndex); }			
			return _frames[frameIndex];			
		}	
		
		protected function findMaxFrames(parent:MovieClip, currentMax:int):int
		{
			for (var i:int=0; i < parent.numChildren; i++)
			{
				var mc:MovieClip = parent.getChildAt(i) as MovieClip;
				if(!mc)
					continue;
				
				currentMax = Math.max(currentMax, mc.totalFrames);            
				
				findMaxFrames(mc, currentMax);
			}
			
			return currentMax;
		}
		
		public function get frameCount() : int { return _frameCount; }
	}
}