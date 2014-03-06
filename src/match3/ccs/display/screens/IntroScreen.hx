package match3.ccs.display.screens;
import flash.events.MouseEvent;
import match3.ccs.Events.GameEvent;
import match3.core.display.ScreenView;
import match3.core.Utils.TextFieldUtils;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button;
import slavara.haxe.core.Utils.DestroyUtil;
using slavara.haxe.core.Utils.ValidateUtil;
#if !(android || ios)
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
#end

/**
 * @author SlavaRa
 */
class IntroScreen extends ScreenView {
	
	public function new() super();
	
	var _start:Button;
	
	public override function destroy() {
		if(_start.isNotNull()) {
			_start.removeEventListener(MouseEvent.CLICK, onStartClick);
			_start = DestroyUtil.destroy(_start);
		}
		super.destroy();
	}
	
	override function render():Bool {
		if(!super.render()) return false;
		if(_start.isNull()) {
			_start = UIBuilder.create(Button);
			_start.autoSize = true;
			_start.format = TextFieldUtils.getServiceButtonFormat();
			_start.text = "button.start";
			addChild(_start);
		}
		update();
		return true;
	}
	
	override function clear() {
		#if !(android || ios)
		stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		#end
		super.clear();
	}
	
	override function update() {
		super.update();
		if(stage.isNull()) return;
		if(_start.isNotNull()) {
			_start.addEventListener(MouseEvent.CLICK, onStartClick);
			_start.x = (stage.stageWidth - _start.w) / 2;
			_start.y = (stage.stageHeight - _start.h) / 2;
		}
		#if !(android || ios)
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		#end
	}
	
	#if !(android || ios)
	function onKeyUp(event:KeyboardEvent) {
		switch (event.keyCode) {
			case Keyboard.ENTER, Keyboard.NUMPAD_ENTER: onStartClick();
		}
	}
	#end
	
	function onStartClick(?_) {
		if(willTrigger(GameEvent.GOTO_WORLD_SCREEN)) {
			dispatchEvent(new GameEvent(GameEvent.GOTO_WORLD_SCREEN, true));
		}
	}
}