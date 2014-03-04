package match3.core.controllers;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Errors.NotImplementedError;

/**
 * @author SlavaRa
 */
class PanelsController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	public var debug(default, null):AbstractPanelController;
	public var settings(default, null):AbstractPanelController;
	
	public override function initialize() {
		super.initialize();
		debug = Type.createInstance(getDebugType(), [baseController]);
		settings = Type.createInstance(getSettingsType(), [baseController]);
	}
	
	function getDebugType():Class<AbstractPanelController> {
		throw new NotImplementedError();
		return null;
	}
	
	function getSettingsType():Class<AbstractPanelController> {
		throw new NotImplementedError();
		return null;
	}
}