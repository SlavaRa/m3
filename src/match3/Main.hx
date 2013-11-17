package match3;
import flash.events.Event;
import flash.Lib;
import match3.core.controllers.Match3Controller;
import slavara.haxe.core.display.DisplayObject.BaseSprite;

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
	
	var _inited:Bool;
	
	function initializeController(?_) {
		if(_inited) return;
		
		_inited = true;
		new Match3Controller(this);
	}
}