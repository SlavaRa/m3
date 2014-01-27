package match3;
import flash.events.Event;
import flash.Lib;
import match3.core.controllers.M3Controller;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.display.DisplayObject.BaseSprite;
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
		stage.addEventListener(Event.RESIZE, initializeController);
		#if ios
		haxe.Timer.delay(initializeController, 100); // iOS 6
		#else
		initializeController();
		#end
	}
	
	var _controller:IController;
	
	function initializeController(?_) {
		if(_controller.isNotNull()) {
			return;
		}
		_controller = new M3Controller(this);
	}
}