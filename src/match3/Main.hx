package match3;
import flash.Lib;
import match3.core.SystemController;
import ru.stablex.ui.UIBuilder;
import slavara.haxe.core.TypeDefs.BaseSprite;
using slavara.haxe.core.utils.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class Main extends BaseSprite {
	
	public static function main() {
	   Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
	   Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
	   Lib.current.addChild(new Main());
	}
	
	public function new() super();	
	
	override function onAddedToStage() {
		stage.addEventListener(flash.events.Event.RESIZE, initializeController);
		#if ios
		haxe.Timer.delay(initializeController, 100); // iOS 6
		#else
		initializeController();
		#end
	}
	
	var _controller:SystemController;
	
	function initializeController(?_) {
		if(_controller.isNotNull()) {
			return;
		}
		UIBuilder.init();
		
		_controller = new SystemController(this);
	}
}