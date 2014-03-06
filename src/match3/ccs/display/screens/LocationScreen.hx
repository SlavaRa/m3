package match3.ccs.display.screens;
import match3.core.display.ScreenView;
import match3.core.models.LocationData;
import match3.core.models.prototypes.LocationProto;
import slavara.haxe.core.Errors.NotImplementedError;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class LocationScreen extends ScreenView {
	
	public function new(data:LocationData) {
		super();
		this.data = data;
	}
	
	override function render():Bool {
		if(!super.render()) return false;
		if(_asset.isNull()) setAsset(cast(data.proto, LocationProto).asset);
		update();
		return true;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) return;
		throw new NotImplementedError();
	}
}