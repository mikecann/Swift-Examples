package co.uk.swft.shooter.components.rendering
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.shooter.components.spatial.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.managers.IScene;
	import co.uk.swft.shooter.proxys.managers.IUpdateable;
	
	import flash.display.Bitmap;
	
	import org.osflash.signals.Signal;
	
	public class SpriteSheetRenderer extends EntityComponent implements IUpdateable
	{
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var spatial : ISpatial2DComponent;
		
		// Signals
		public var onAnimationComplete : Signal = new Signal();
		
		// Publics
		public var sheet : SpriteSheet;
		public var currentFrameIndex : int;
		public var timesToPlay : int=-1;
		public var targetFPS : int = 60;
		
		// Protecteds
		protected var _bitmap : Bitmap;
		protected var _playCount : int;
		protected var _frameTimer : int;		
						
		override public function onRegister():void
		{
			super.onRegister();
			_bitmap = new Bitmap();
			_playCount = 0;
			currentFrameIndex = 0;
			scene.addChild(_bitmap);
			scene.registerForUpdates(this);
		}
		
		public function update(frameDelta:int) : void
		{
			if (sheet==null){ return; }
			
			// Update the frame
			var oldFrameIndex : int = currentFrameIndex;
			var targetFrameTime : int = 1000/targetFPS;
			_frameTimer += frameDelta;
			while(_frameTimer>targetFrameTime)
			{
				_frameTimer-=targetFrameTime;
				currentFrameIndex++;
				if (currentFrameIndex>sheet.frameCount)
				{
					currentFrameIndex=0; 
					_playCount++;
					if (timesToPlay!=-1 && _playCount==timesToPlay)
					{
						onAnimationComplete.dispatch();
						break;
					}
				}
			}			
			
			// If it changed then set the new frame
			var f : SpriteSheetFrame = sheet.getFrame(currentFrameIndex);
			if (_bitmap.bitmapData!=f.bmd){	_bitmap.bitmapData = f.bmd; }
			
			// Update the position of the bitmap
			_bitmap.x = spatial.position.x - f.centreOffset.x;
			_bitmap.y = spatial.position.y - f.centreOffset.y;
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			scene.unRegisterForUpdates(this);
			scene.removeChild(_bitmap);
		}		
	}
}