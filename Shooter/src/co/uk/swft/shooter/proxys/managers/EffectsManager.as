package co.uk.swft.shooter.proxys.managers
{
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.entities.effects.AnimatedEffect;
	
	import org.robotlegs.mvcs.Actor;
	
	public class EffectsManager extends Actor
	{
		// Dependencies
		[Inject] public var entityMap : IEntityMap;
		
		// Protected
		public var _effects : Array;
		
		public function init() : void			
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
			effect.onRemove();
			_effects.splice(_effects.indexOf(effect),1);
		}
	}
}