package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.base.GameManager;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.effects.AnimatedEffect;
	
	import org.robotlegs.mvcs.Actor;
	
	public class EffectsManager extends GameManager
	{		
		// Protected
		public var _effects : Array;
		
		override public function onGameStartup():void
		{
			_effects = [];
		}
		
		public function spawnEffect(effectClass:Class) : AnimatedEffect
		{
			var e : AnimatedEffect = entityMap.createEntity(effectClass) as AnimatedEffect;
			e.onEffectComplete.add( function():void{ removeEffect(e); } );
			_effects.push(e);
			return e;
		}
		
		public function removeEffect(effect:AnimatedEffect) : void
		{			
			_effects.splice(_effects.indexOf(effect),1);
			entityMap.removeEntity(effect);
		}
	}
}