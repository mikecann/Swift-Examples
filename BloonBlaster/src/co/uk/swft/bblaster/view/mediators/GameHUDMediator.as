package co.uk.swft.bblaster.view.mediators
{
	import co.uk.swft.bblaster.mangers.ScoreManager;
	import co.uk.swft.bblaster.view.components.GameHUD;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameHUDMediator extends Mediator
	{
		// View
		[Inject] public var view : GameHUD;
		
		// Dependencies
		[Inject] public var scores : ScoreManager;
		
		override public function onRegister():void
		{
			view.score = scores.score;
		}
	}
}