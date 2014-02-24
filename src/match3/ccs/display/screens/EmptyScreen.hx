package match3.ccs.display.screens;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import match3.core.Utils.TextFieldUtils;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.Utils.DestroyUtil;
import slavara.haxe.game.Models.UnknownData;
using slavara.haxe.core.Utils.ValidateUtil;
using slavara.haxe.core.Utils.StringUtil;

/**
 * @author SlavaRa
 * TODO: rename to BaseScreen
 */
class EmptyScreen extends ResourceSprite {

	public function new() super();
	
	public var data(null, set):UnknownData;
	
	inline function set_data(value:UnknownData):UnknownData {
		if(value != data) {
			data = value;
			update();
		}
		return data;
	}
	
	var _label:TextField;
	
	public override function destroy() {
		super.destroy();
		data = null;
		_label = DestroyUtil.destroy(_label);
	}
	
	override function render():Bool {
		if(!super.render()) {
			return false;
		}
		
		if(_label.isNull()) {
			_label = new TextField();
			_label.defaultTextFormat = TextFieldUtils.getServiceTextFormat();
			addChild(_label);
		}
		
		update();
		return true;
	}
	
	override function update() {
		super.update();
		if(stage.isNull() || data.isNull()) {
			return;
		}
		
		if(_label.isNotNull()) {
			_label.autoSize = TextFieldAutoSize.LEFT;
			_label.text = !data.proto.desc.isNullOrEmpty() ? data.proto.desc : "";
			_label.x = stage.stageWidth - _label.width - 5;
			_label.y = stage.stageHeight - _label.height;
		}
	}
}