package match3.ccs.display.screens.world;
import flash.events.MouseEvent;
import haxe.Log;
import match3.ccs.Events.GameEvent;
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
		if(asset.isNotNull()) {
			asset.removeEventListener(MouseEvent.CLICK, onAssetClick);
			asset.removeEventListener(MouseEvent.MOUSE_OVER, onAssetMouseOver);
			asset.removeEventListener(MouseEvent.MOUSE_OUT, onAssetMouseOut);
		}
		data = null;
		super.destroy();
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
		asset.addEventListener(MouseEvent.CLICK, onAssetClick);
		asset.addEventListener(MouseEvent.MOUSE_OVER, onAssetMouseOver);
		asset.addEventListener(MouseEvent.MOUSE_OUT, onAssetMouseOut);
	}
	
	function onAssetClick(?_) {
		if(willTrigger(GameEvent.GOTO_LOCATION_SCREEN)) {
			dispatchEvent(new GameEvent(GameEvent.GOTO_LOCATION_SCREEN, true, data));
		}
	}
	
	function onAssetMouseOver(?_) {
		Log.trace("onAssetMouseOver");
	}
	
	function onAssetMouseOut(?_) {
		Log.trace("onAssetMouseOut");
	}
}