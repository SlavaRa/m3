package match3.ccs.controllers;
import match3.ccs.controllers.panels.CCSDebugPanelController;
import match3.ccs.controllers.panels.CCSSettingsPanelController;
import match3.core.controllers.PanelController;
import match3.core.controllers.PanelsController;
import slavara.haxe.core.controllers.BaseController.IController;

/**
 * @author SlavaRa
 */
class CCSPanelsController extends PanelsController {
	
	public function new(controller:IController) super(controller);
	
	override function getDebugType():Class<PanelController> return CCSDebugPanelController;
	
	override function getSettingsType():Class<PanelController> return CCSSettingsPanelController;
}