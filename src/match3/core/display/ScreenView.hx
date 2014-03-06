package match3.core.display;
import flash.display.DisplayObject;
import slavara.haxe.core.Errors.ArgumentNullError;
import slavara.haxe.core.TypeDefs.DisplayObjectContainer;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.Utils.DestroyUtil;
import slavara.haxe.game.Models.UnknownData;
import slavara.haxe.game.Resource.SWFResRef;
using slavara.haxe.core.Utils.DisplayUtils;
using slavara.haxe.core.Utils.ValidateUtil;
using Std;

/**
 * @author SlavaRa
 */
class ScreenView extends ResourceSprite {

	function new(?asset:DisplayObjectContainer) {
		super();
		_asset = asset;
	}
	
	public var data(null, set):UnknownData;
	var _asset(default, null):DisplayObjectContainer;
	
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
	
	public function setAsset(ref:SWFResRef) {
		#if debug
		if(ref.isNull()) throw new ArgumentNullError("res");
		#end
		var index = 0;
		if(_asset.isNotNull() && _asset.parent.isNotNull()) {
			index = getChildIndex(_asset);
			removeChild(_asset);
		}
		DestroyUtil.destroy(_asset, false);
		_asset = cast(getSWF(ref).createMovieClip(ref.link), DisplayObjectContainer);
		addChildAt(_asset, index);
	}
	
	public function getContainer(name:String):DisplayObjectContainer {
		if(_asset.isNull()) return null;
		var child = _getChildByName(_asset, name);
		return child.isNotNull() && child.is(DisplayObjectContainer) ? cast(child, DisplayObjectContainer) : null;
	}
	
	public function addChildWithContainer(child:DisplayObject, container:DisplayObject) {
		var index = _asset.getChildIndex(container);
		if(index >= numChildren) index = numChildren - 1;
		addChildAt(child.setXY(container.x, container.y), index);
	}
}