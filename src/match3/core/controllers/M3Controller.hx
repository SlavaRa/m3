package match3.core.controllers;
import flash.display.DisplayObjectContainer;
import match3.core.controllers.ServerController;
import match3.core.models.M3Data;
import slavara.haxe.core.controllers.BaseController;

/**
 * @author SlavaRa
 */
class M3Controller extends BaseController {
	
	public function new(container:DisplayObjectContainer) super(container, new M3Data());
	
	var _serverController:ServerController;
	
	public override function initialize() {
		_serverController = new ServerController();
	}
}