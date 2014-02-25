package match3.ccs.controllers;
import match3.ccs.Enums.GameState;
import match3.ccs.Events.GameEvent;
import match3.ccs.factories.CCSScreenFactory;
import match3.ccs.models.CCSUniverse;
import match3.core.Enums.ServerCommand;
import match3.core.factories.ViewFactory.ScreenFactory;
import match3.core.models.LocationData;
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
		container.addEventListener(GameEvent.GOTO_LOCATION_SCREEN, onGotoLocationScreen);
	}
	
	public override function getServerType():Class<Dynamic> return CCSServerController;
	
	public override function createScreenFactory():ScreenFactory return new CCSScreenFactory(cast(data, CCSUniverse));
	
	public override function start() {
		super.start();
		cast(data, CCSUniverse).stateMachine.setState(GameState.World);
	}
	
	function onReset(?_) server.send(ServerCommand.Reset);
	
	function onGotoEmptyScreen(?_) cast(data, CCSUniverse).stateMachine.setState(GameState.Empty);
	
	function onGotoWorldScreen(?_) cast(data, CCSUniverse).stateMachine.setState(GameState.World);
	
	function onGotoLocationScreen(event:GameEvent) cast(data, CCSUniverse).gotoLocation(cast(event.data, LocationData));
}