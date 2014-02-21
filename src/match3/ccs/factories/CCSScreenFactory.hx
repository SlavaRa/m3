package match3.ccs.factories;
import match3.ccs.Enums.GameState;
import match3.ccs.display.screens.EmptyScreen;
import match3.ccs.display.screens.LocationScreen;
import match3.ccs.display.screens.WorldScreen;
import match3.core.factories.ViewFactory.ScreenFactory;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class CCSScreenFactory extends ScreenFactory {
	public function new() super();
	
	public override function getScreens(data):Map<EnumValue, DisplayObject> {
		return [
			GameState.Empty => new EmptyScreen(),
			GameState.World => new WorldScreen(),
			GameState.Location => new LocationScreen(),
		];
	}
}