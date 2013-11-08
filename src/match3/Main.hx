package match3;

import flash.display.DisplayObject;
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
	
	public function new() {
		super();	
	}
	
	var inited:Bool;

	function onStageResize(?_) if (!inited) initialize();
	
	override function onAddedToStage() {
		stage.addEventListener(Event.RESIZE, onStageResize);
		#if ios
		haxe.Timer.delay(initialize, 100); // iOS 6
		#else
		initialize();
		#end
	}
	
	function initialize() {
		if (inited) {
			return;
		}
		inited = true;
		
		new Match3Controller(this);
	}
}