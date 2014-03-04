package match3.core.controllers;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Errors.NotImplementedError;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class PanelsController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	public var debug(default, null):AbstractPanelController;
	public var settings(default, null):AbstractPanelController;
	
	public override function initialize() {
		super.initialize();
		var aClass:Class<Dynamic> = null;
		
		aClass = getDebugType();
		if(aClass.isNotNull()) debug = Type.createInstance(aClass, [baseController]);
		
		aClass = getSettingsType();
		if(aClass.isNotNull()) settings = Type.createInstance(aClass, [baseController]);
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