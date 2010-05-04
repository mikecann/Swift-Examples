package co.uk.swft.shooter.components.implementation
{
	import co.uk.swft.base.EntityComponent;
	import co.uk.swft.shooter.components.interfaces.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
	import co.uk.swft.shooter.proxys.interfaces.IUpdateable;
	import co.uk.swft.shooter.signals.ShootBulletSignal;
	
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;

	public class PlayerController extends EntityComponent implements IUpdateable
	{					
		// Dependencies
		[Inject] public var scene : IScene;
		[Inject] public var spatial : ISpatial2DComponent;
		
		// Signals
		public var shootBullet : Signal = new Signal();
		
		// Protecteds
		protected var _mouseDown : Boolean = false;
		protected var _fireTimer : int = 0;
		
		override public function onRegister():void
		{
			scene.registerForUpdates(this);	
			scene.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true);
			scene.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, false, 0, true);
		}
		
		override public function onRemove():void
		{
			scene.unRegisterForUpdates(this);
			scene.stage.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false);
			scene.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, false);
		}
		
		protected function onMouseDown(e:MouseEvent) : void { _mouseDown=true; }
		protected function onMouseUp(e:MouseEvent) : void { _mouseDown=false; }
		
		public function update(frameDelta:int) : void
		{
			spatial.position.x += (scene.stage.mouseX-spatial.position.x)/6;
			spatial.position.y += (scene.stage.mouseY-spatial.position.y)/6;
			
			if (_mouseDown)
			{
				_fireTimer += frameDelta;
				if(_fireTimer>100)
				{
					_fireTimer = 0;
					shootBullet.dispatch();
				}
			}
		}
	}
}