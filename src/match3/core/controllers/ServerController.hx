package match3.core.controllers;
import match3.core.Enums.ServerCommand;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;

/**
 * @author SlavaRa
 */
class ServerController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	public function send(command:ServerCommand, ?data:Dynamic, ?onResponseReceived:Dynamic->Void, ?onResponseSavedData:Dynamic) {
		
	}
}