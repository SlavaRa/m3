package match3.ccs.display.panels;
import flash.events.MouseEvent;
import match3.ccs.Events.GameEvent;
import match3.core.Utils.TextFieldUtils;
import ru.stablex.ui.skins.Paint;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.HBox;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.utils.Utils.DestroyUtil;

/**
 * @author SlavaRa
 */
class DebugPanelView extends ResourceSprite {

	public function new() super();
	
	var _box:HBox;
	
	public override function initialize() {
		super.initialize();
		
		var boxSkin = new Paint();
		boxSkin.color = 0x000000;
		
		var btnSkin = new Paint();
		btnSkin.color = 0x000000;
		btnSkin.borderColor = 0x00AE00;
		btnSkin.border = 1;
		
		_box = UIBuilder.create(HBox);
		_box.x = 0;
		_box.h = 30;
		_box.skin = boxSkin;
		_box.align = "left,middle";
		_box.paddingRight = 10;
		_box.paddingLeft = 10;
		_box.childPadding = 5;
		
		var label2handler:Map<String, MouseEvent->Void> = new Map();
		label2handler.set("reset", onResetClick);
		label2handler.set("empty screen", onEmptyScreenClick);
		label2handler.set("world screen", onWorldScreenClick);
		
		for(it in label2handler.keys()) {
			var btn:Button = UIBuilder.create(Button);
			btn.autoSize = true;
			btn.format = TextFieldUtils.getServiceButtonFormat();
			btn.text = it;
			btn.skin = btnSkin;
			btn.applySkin();
			btn.addEventListener(MouseEvent.CLICK, label2handler.get(it));
			
			_box.addChild(btn);
		}
		
		addChild(_box);
	}
	
	public override function destroy() {
		super.destroy();
		
		_box = DestroyUtil.destroy(_box);
	}
	
	override function onAddedToStage() {
		super.onAddedToStage();
		
		updateHBox();
	}
	
	inline function updateHBox() {
		_box.y = stage.stageHeight - _box.h;
		_box.w = stage.stageWidth - 200;
	}
	
	function onResetClick(event:MouseEvent) {
		if(willTrigger(GameEvent.RESET)) {
			super.dispatchEvent(new GameEvent(GameEvent.RESET, true));
		}
	}
	
	function onEmptyScreenClick(event:MouseEvent) {
		if(willTrigger(GameEvent.GOTO_EMPTY_SCREEN)) {
			super.dispatchEvent(new GameEvent(GameEvent.GOTO_EMPTY_SCREEN, true));
		}
	}
	
	function onWorldScreenClick(event:MouseEvent) {
		if(willTrigger(GameEvent.GOTO_WORLD_SCREEN)) {
			super.dispatchEvent(new GameEvent(GameEvent.GOTO_WORLD_SCREEN, true));
		}
	}
}