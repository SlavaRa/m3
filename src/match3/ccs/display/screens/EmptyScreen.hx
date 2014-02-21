package match3.ccs.display.screens;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import match3.core.Utils.TextFieldUtils;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.utils.Utils.DestroyUtil;

/**
 * @author SlavaRa
 */
class EmptyScreen extends ResourceSprite {

	public function new() super();
	
	var _label:TextField;
	
	public override function initialize() {
		super.initialize();
		
		initializeDebugLabel();
	}
	
	public override function destroy() {
		super.destroy();
		
		_label = DestroyUtil.destroy(_label);
	}
	
	override function onAddedToStage() {
		super.onAddedToStage();
		
		_label.x = stage.stageWidth - _label.width - 5;
		_label.y = stage.stageHeight - _label.height;
		addChild(_label);
	}
	
	override function onRemovedFromStage() {
		super.onRemovedFromStage();
		
		removeChild(_label);
	}
	
	inline function initializeDebugLabel() {
		_label = new TextField();
		_label.defaultTextFormat = TextFieldUtils.getServiceTextFormat();
		_label.autoSize = TextFieldAutoSize.LEFT;
		_label.text = getDebugLabelText();
	}
	
	function getDebugLabelText():String return "Empty screen";
}