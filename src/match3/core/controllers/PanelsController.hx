package match3.core.controllers;
import match3.core.controllers.panels.DebugPanelController;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;

/**
 * @author SlavaRa
 */
class PanelsController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	public var debug(default, null):DebugPanelController;
	
	public override function initialize() {
		super.initialize();
		
		debug = new DebugPanelController(baseController);
	}
}