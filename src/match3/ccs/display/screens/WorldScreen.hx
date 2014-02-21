package match3.ccs.display.screens;
import match3.core.models.WorldData;
import slavara.haxe.core.Models.Data;

/**
 * @author SlavaRa
 */
class WorldScreen extends EmptyScreen {

	public function new(data:WorldData) {
		super();
		this.data = data;
	}
	
	public var data(null, set):WorldData;
	
	inline function set_data(value:WorldData) {
		if(value != data) {
			data = value;
		}
		return data;
	}
	
	public override function destroy() {
		super.destroy();
	}
	
	override function getDebugLabelText():String return "World screen";
}