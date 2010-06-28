package co.uk.swft.shooter.components.other
{
	import co.uk.swft.base.EntityComponent;
	
	import org.osflash.signals.Signal;
	
	public class HealthComponent extends EntityComponent
	{
		// Signals
		public var onHPReachedMinimum : Signal = new Signal();
		
		// Protecteds
		protected var _currentHP : Number = 100;
		protected var _minHP : Number = 0;
		protected var _maxHP : Number = 100;
	
		public function initValues(minHP:Number, maxHP:Number, startingHP:Number) : void
		{
			_minHP = minHP;
			_maxHP = maxHP;
			_currentHP = Math.min(startingHP,_maxHP);
		}
		
		public function changeHitpoints(value:Number) : void
		{
			_currentHP += value;
			_currentHP = Math.max(_currentHP,_minHP);
			_currentHP = Math.min(_currentHP,_maxHP);
			if (_currentHP==_minHP){ onHPReachedMinimum.dispatch(); }
		}
		
		public function get currentHP() : Number { return _currentHP; }
	}
}