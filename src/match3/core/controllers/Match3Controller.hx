package match3.core.controllers;
import flash.display.DisplayObjectContainer;
import match3.core.display.Math3View;
import match3.core.models.Match3Data;
import slavara.haxe.core.controllers.BaseController;

/**
 * @author SlavaRa
 */
class Match3Controller extends BaseController {
	
	public function new(container:DisplayObjectContainer) {
		super(container, new Match3Data());
		initializeView();
	}
	
	var _view:Math3View;
	
	function initialize() {
		_view = new Math3View();
		container.addChild(_view);
	}
	
}