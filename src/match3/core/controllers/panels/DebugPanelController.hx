package match3.core.controllers.panels;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IBaseController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Errors.NotImplementedError;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class DebugPanelController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	var _view:DisplayObject;
	
	public function getViewRenderer():Class<Dynamic> {
		throw new NotImplementedError();
		return null;
	}
	
	public override function initialize() {
		super.initialize();
		_view = Type.createInstance(getViewRenderer(), []);
		cast(baseController, IBaseController).container.addChild(_view);
	}
}