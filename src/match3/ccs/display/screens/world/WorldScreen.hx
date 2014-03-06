package match3.ccs.display.screens.world;
import match3.core.display.ScreenView;
import match3.core.models.prototypes.WorldProto;
import match3.core.models.WorldData;
import slavara.haxe.core.Utils.DestroyUtil;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class WorldScreen extends ScreenView {

	public function new(data:WorldData) {
		super();
		this.data = data;
	}
	
	var _locations:Array<WorldLocation>;
	
	public override function initialize() {
		super.initialize();
		_locations = [];
	}
	
	public override function destroy() {
		_locations = DestroyUtil.destroy(_locations);
		super.destroy();
	}
	
	override function render():Bool {
		if(!super.render()) return false;
		if(asset.isNull()) setAsset(cast(data.proto, WorldProto).asset);
		var count = 0;
		for(i in 0...asset.numChildren) {
			var container = getContainer("location_" + count++);
			if(container.isNull()) break;
			var location = new WorldLocation(container);
			addChildWithContainer(location, container);
			_locations.push(location);
		}
		update();
		return true;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) return;
		var data:WorldData = cast(this.data, WorldData);
		var iterator:Iterator<WorldLocation> = _locations.iterator();
		for(it in data.locations.getItems()) {
			if(!iterator.hasNext()) break;
			iterator.next().data = it;
		}
	}
}