package match3.ccs;
import match3.ccs.display.screens.BaseScreen;
import match3.ccs.display.screens.LocationScreen;
import match3.ccs.display.screens.world.WorldScreen;
import match3.ccs.Enums.GameState;
import match3.ccs.models.CCSUniverseData;
import match3.core.Factories.ScreenFactory;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class CCSScreenFactory extends ScreenFactory {
	public function new(data:CCSUniverseData) {
		super();
		_data = data;
	}
	
	var _data:CCSUniverseData;
	
	public override function getScreens():Map<EnumValue, DisplayObject> {
		return [
			GameState.World => new WorldScreen(_data.world),
			GameState.Location => new LocationScreen(_data.world),
		];
	}
}