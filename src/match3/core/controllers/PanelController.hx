package match3.core.controllers;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IBaseController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Errors.NotImplementedError;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class PanelController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	var _view:DisplayObject;
	
	public override function initialize() {
		super.initialize();
		_view = Type.createInstance(getViewType(), []);
		cast(baseController, IBaseController).container.addChild(_view);
	}
	
	function getViewType():Class<DisplayObject> {
		throw new NotImplementedError();
		return null;
	}
}