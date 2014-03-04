package match3.ccs.controllers.panels;
import match3.ccs.display.panels.DebugPanelView;
import match3.core.controllers.panels.DebugPanelController;
import slavara.haxe.core.controllers.BaseController.IController;


/**
 * @author SlavaRa
 */
class CCSDebugPanelController extends DebugPanelController {
	
	public function new(controller:IController) super(controller);
	
	public override function getViewRenderer():Class<Dynamic> return DebugPanelView;
}