package match3.ccs.display.screens;
import match3.core.models.prototypes.WorldProto;
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
	
	override function render():Bool {
		if(!super.render()) return false;
		if(asset.isNull()) setAsset(cast(data.proto, WorldProto).asset);
		
		update();
		return true;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) return;
		
		//CODE HERE
	}
}