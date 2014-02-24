package match3.ccs.display.screens.world;
import match3.core.models.LocationData;
import slavara.haxe.core.TypeDefs.DisplayObjectContainer;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.TypeDefs.Sprite;
using slavara.haxe.core.Utils.ValidateUtil;
using Std;

/**
 * @author SlavaRa
 */
class WorldLocation extends ResourceSprite {
	
	public function new(asset:DisplayObjectContainer) super(asset);
	
	public var data(null, set):LocationData;
	
	inline function set_data(value:LocationData):LocationData {
		if(value != data) {
			data = value;
			update();
		}
		return data;
	}
	
	public override function destroy() {
		super.destroy();
		data = null;
	}
	
	override function render():Bool {
		if(!super.render()) return false;
		update();
		return true;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) return;
		
		var isAvailable:Bool = data.isAvailable;
		asset.mouseChildren = false;
		asset.mouseEnabled = isAvailable;
		if(asset.is(Sprite)) cast(asset, Sprite).buttonMode = isAvailable;
		asset.alpha = isAvailable ? 1.0 : 0.5;
	}
}