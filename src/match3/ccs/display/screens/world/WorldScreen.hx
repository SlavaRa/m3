package match3.ccs.display.screens.world;
import match3.ccs.display.screens.EmptyScreen;
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
		
		var data:WorldData = cast(data, WorldData);
		for(it in data.locations.getItems()) {
			var container = getContainer("location_" + it.id);
			addChildWithContainer(new WorldLocation(container), container);
		}
		
		update();
		return true;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) return;
		
	}
}