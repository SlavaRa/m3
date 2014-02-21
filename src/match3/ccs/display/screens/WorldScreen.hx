package match3.ccs.display.screens;
import match3.core.models.WorldData;
using slavara.haxe.core.utils.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class WorldScreen extends EmptyScreen {

	public function new(data:WorldData) {
		super();
		this.data = data;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) {
			return;
		}
		
		//draw locations
	}
}