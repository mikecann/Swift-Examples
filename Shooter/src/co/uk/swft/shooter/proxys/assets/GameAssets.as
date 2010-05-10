package co.uk.swft.shooter.proxys.assets
{
	public class GameAssets
	{
		// Embeds
		[Embed(source="assets/assets.swf", symbol="player_ship")] public static const playerShip : Class;
		[Embed(source="assets/assets.swf", symbol="player_bullet")] public static const playerBullet : Class;
		[Embed(source="assets/assets.swf", symbol="enemy_ship1")] public static const slowEnemyShip:Class;
		[Embed(source="assets/assets.swf", symbol="enemy_ship2")] public static const fastEnemyShip : Class;	
		[Embed(source="assets/assets.swf", symbol="explosion_med")] public static const mediumExplosion : Class;	
	}
}