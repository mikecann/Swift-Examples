package co.uk.swft.bblaster.mangers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.bblaster.mangers.vo.ScoreVO;
	
	public class ScoreManager extends GameManager
	{
		[Bindable] public var score : ScoreVO;
		
		override public function onGameStartup():void
		{			
		}
		
		override public function onNextLevel():void
		{	
			score = new ScoreVO();			
		}
		
		public function changeScore(byAmount:int) : void			
		{
			score.score += byAmount;
		}
	}
}