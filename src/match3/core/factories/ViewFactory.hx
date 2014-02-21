package match3.core.factories;
import slavara.haxe.core.Errors.NotImplementedError;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class ScreenFactory {
	public function new() {}
	
	public function getScreens(data):Map<EnumValue, DisplayObject> {
		throw new NotImplementedError();
		return null;
	}
}