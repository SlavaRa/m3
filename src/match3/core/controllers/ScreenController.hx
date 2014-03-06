package match3.core.controllers;
import match3.core.controllers.SystemController;
import match3.core.display.ScreenViewContainer;
import slavara.haxe.core.controllers.BaseController.AbstractController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.Interfaces.IStateMachineHolder;

/**
 * @author SlavaRa
 */
class ScreenController extends AbstractController {

	public function new(controller:IController) super(controller);
	
	public override function initialize() {
		super.initialize();
		var system:SystemController = cast(baseController, SystemController);
		var view = new ScreenViewContainer(system.createScreenFactory());
		system.container.addChild(view);
		view.data = cast(data, IStateMachineHolder);
	}
}