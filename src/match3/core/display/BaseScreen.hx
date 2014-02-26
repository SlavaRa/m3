package match3.core.display;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.game.Models.UnknownData;

/**
 * @author SlavaRa
 */
class BaseScreen extends ResourceSprite {

	function new() super();
	
	public var data(null, set):UnknownData;
	
	inline function set_data(value:UnknownData):UnknownData {
		if(value != data) {
			data = value;
			update();
		}
		return data;
	}
	
	public override function destroy() {
		data = null;
		super.destroy();
	}
}