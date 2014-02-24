package match3.core.controllers;
import match3.core.display.ScreenView;
import match3.core.SystemController;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Interfaces.IStateMachineHolder;

/**
 * @author SlavaRa
 */
class ScreenController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	var _view:ScreenView;
	
	public override function initialize() {
		super.initialize();
		
		var system:SystemController = cast(baseController, SystemController);
		
		system.container.addChild(_view = new ScreenView(system.createScreenFactory()));
		_view.data = cast(data, IStateMachineHolder);
	}
}