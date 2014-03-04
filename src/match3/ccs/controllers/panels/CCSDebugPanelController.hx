package match3.ccs.controllers.panels;
import match3.ccs.display.panels.DebugPanelView;
import match3.core.controllers.AbstractPanelController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class CCSDebugPanelController extends AbstractPanelController {
	
	public function new(controller:IController) super(controller);
	
	override function getViewType():Class<DisplayObject> return DebugPanelView;
}