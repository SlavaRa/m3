package match3;
import flash.Lib;
import match3.ccs.controllers.CCSSystemController;
import slavara.haxe.core.TypeDefs.BaseSprite;

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
	
	var _controller:CCSSystemController;
	
	public override function initialize() {
		super.initialize();
		ru.stablex.ui.UIBuilder.init();
		_controller = new CCSSystemController(this);
	}
	
	override function render():Bool {
		if(!super.render()) {
			return false;
		}
		
		#if ios
		haxe.Timer.delay(initializeController, 100);
		#else
		initializeController();
		#end
		return true;
	}
	
	function initializeController(?_) _controller.start();
}