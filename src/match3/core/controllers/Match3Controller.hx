package match3.core.controllers;
import flash.display.DisplayObjectContainer;
import match3.core.models.Match3Data;
import slavara.haxe.core.controllers.BaseController;

/**
 * @author SlavaRa
 */
class Match3Controller extends BaseController {
	
	public function new(container:DisplayObjectContainer) super(container, new Match3Data());
	
	public override function initialize() {
	}
	
}