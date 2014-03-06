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
	
	public function new(asset:DisplayObjectContainer) {
		super();
		this._asset = asset;
	}
	
	public var data(null, set):LocationData;
	var _asset:DisplayObjectContainer;
	
	inline function set_data(value:LocationData):LocationData {
		if(value != data) {
			data = value;
			update();
		}
		return data;
	}
	
	public override function destroy() {
		if(_asset.isNotNull()) {
			_asset.removeEventListener(MouseEvent.CLICK, onAssetClick);
			#if !(android || ios)
			_asset.removeEventListener(MouseEvent.MOUSE_OVER, onAssetMouseOver);
			_asset.removeEventListener(MouseEvent.MOUSE_OUT, onAssetMouseOut);
			#end
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
		_asset.mouseChildren = false;
		_asset.mouseEnabled = isAvailable;
		if(_asset.is(Sprite)) cast(_asset, Sprite).buttonMode = isAvailable;
		_asset.alpha = isAvailable ? 1.0 : 0.5;
		_asset.addEventListener(MouseEvent.CLICK, onAssetClick);
		#if !(android || ios)
		_asset.addEventListener(MouseEvent.MOUSE_OVER, onAssetMouseOver);
		_asset.addEventListener(MouseEvent.MOUSE_OUT, onAssetMouseOut);
		#end
	}
	
	function onAssetClick(?_) {
		if(willTrigger(GameEvent.GOTO_LOCATION_SCREEN)) {
			dispatchEvent(new GameEvent(GameEvent.GOTO_LOCATION_SCREEN, true, data));
		}
	}
	
	#if !(android || ios)
	function onAssetMouseOver(?_) {
		Log.trace("onAssetMouseOver");
	}
	
	function onAssetMouseOut(?_) {
		Log.trace("onAssetMouseOut");
	}
	#end
}