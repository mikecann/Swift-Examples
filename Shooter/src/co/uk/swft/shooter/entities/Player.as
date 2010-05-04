package co.uk.swft.shooter.entities
{
	import co.uk.swft.base.Entity;
	import co.uk.swft.base.EntityMap;
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.shooter.components.implementation.PlayerController;
	import co.uk.swft.shooter.components.implementation.SimpleSpriteRenderer;
	import co.uk.swft.shooter.components.implementation.Spatial2DComponent;
	import co.uk.swft.shooter.components.interfaces.ISpatial2DComponent;
	import co.uk.swft.shooter.proxys.interfaces.IScene;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Player extends Entity
	{
		// Assets
		[Embed(source="assets/assets.swf", symbol="player_ship")] public const shipGraphic : Class;
		[Embed(source="assets/assets.swf", symbol="player_bullet")] public const bulletGraphic : Class;
		
		// Dependencies
		[Inject] public var scene : IScene;
		
		// Components
		[Inject] public var renderer : SimpleSpriteRenderer;
		[Inject] public var spatial : ISpatial2DComponent;
		[Inject] public var controller : PlayerController;
		
		override public function mapComponents() : void
		{
			// Map components
			injector.mapSingletonOf(ISpatial2DComponent, Spatial2DComponent);
			injector.mapSingleton(SimpleSpriteRenderer);
			injector.mapSingleton(PlayerController);
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			renderer.sprite = new shipGraphic();					
			controller.shootBullet.add( onShootBullet );
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			controller.shootBullet.remove( onShootBullet );
		}
		
		protected function onShootBullet() : void
		{
			var b : Bullet = entityMap.createEntity(Bullet) as Bullet;
			b.spatial.position.x = spatial.position.x - renderer.sprite.width/2 + 10;
			b.spatial.position.y = spatial.position.y;
			b.spatial.velocity.y = -0.5;
			b.renderer.sprite = new bulletGraphic();	
			
			b = entityMap.createEntity(Bullet) as Bullet;
			b.spatial.position.x = spatial.position.x + renderer.sprite.width/2 - 10;
			b.spatial.position.y = spatial.position.y;
			b.spatial.velocity.y = -0.5;
			b.renderer.sprite = new bulletGraphic();
		}
		
		
	}
}