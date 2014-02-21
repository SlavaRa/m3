package match3.ccs.controllers;
import match3.ccs.Enums.GameState;
import match3.ccs.Events.GameEvent;
import match3.ccs.factories.CCSScreenFactory;
import match3.ccs.models.CCSUniverse;
import match3.core.DataBase;
import match3.core.Enums.ServerCommand;
import match3.core.factories.ViewFactory.ScreenFactory;
import match3.core.SystemController;
import slavara.haxe.core.TypeDefs.DisplayObjectContainer;

/**
 * @author SlavaRa
 */
class CCSSystemController extends SystemController {

	public function new(container:DisplayObjectContainer) super(container, new CCSUniverse());
	
	override function initializeListeners() {
		super.initializeListeners();
		
		container.addEventListener(GameEvent.RESET, onReset);
		container.addEventListener(GameEvent.GOTO_EMPTY_SCREEN, onGotoEmptyScreen);
		container.addEventListener(GameEvent.GOTO_WORLD_SCREEN, onGotoWorldScreen);
	}
	
	public override function createScreenFactory():ScreenFactory return new CCSScreenFactory();
	
	function onReset(?_) server.send(ServerCommand.Reset);
	
	function onGotoEmptyScreen(?_) cast(data, DataBase).stateMachine.setState(GameState.Empty);
	
	function onGotoWorldScreen(?_) cast(data, DataBase).stateMachine.setState(GameState.World);	
}