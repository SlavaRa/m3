package match3.core.controllers;
import match3.core.display.ScreenView;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IBaseController;
import slavara.haxe.core.controllers.BaseController.IController;

/**
 * @author SlavaRa
 */
class ScreenController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	var _view:ScreenView;
	
	public override function initialize() {
		cast(baseController, IBaseController).container.addChild(_view = new ScreenView());
	}
}