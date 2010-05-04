package co.uk.mikecann.app.components
{
	import org.osflash.signals.Signal;

	public interface IShapeRenderer
	{
		function get clicked() : Signal;
		function set colour(c:uint) : void
		function get colour() : uint;
	}
}