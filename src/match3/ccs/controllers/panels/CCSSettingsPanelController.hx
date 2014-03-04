package match3.ccs.controllers.panels;
import match3.ccs.display.panels.SettingsPanel;
import match3.core.controllers.PanelController;
import slavara.haxe.core.controllers.BaseController.IController;
import slavara.haxe.core.TypeDefs.DisplayObject;

/**
 * @author SlavaRa
 */
class CCSSettingsPanelController extends PanelController {

	public function new(controller:IController) super(controller);
	
	override function getViewType():Class<DisplayObject> return SettingsPanel;
}