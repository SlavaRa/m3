package match3.core.display.screens;
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
		initializeDebugMenu();
	}
	
	public override function destroy() {
		super.destroy();
		
		_label = DestroyUtil.destroy(_label);
	}
	
	override function onAddedToStage() {
		super.onAddedToStage();
		
		_label.x = stage.stageWidth - _label.width - 10;
		_label.y = stage.stageHeight - _label.height - 10;
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
	
	inline function initializeDebugMenu() {
		
	}
	
}