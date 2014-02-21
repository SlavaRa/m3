package match3.core.controllers.panels;
import match3.ccs.display.panels.DebugPanelView;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IBaseController;
import slavara.haxe.core.controllers.BaseController.IController;

/**
 * @author SlavaRa
 */
class DebugPanelController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	var _view:DebugPanelView;
	
	public override function initialize() {
		super.initialize();
		
		cast(baseController, IBaseController).container.addChild(_view = new DebugPanelView());
	}
}