package match3.ccs.controllers;
import match3.ccs.Enums.GameState;
import match3.ccs.Events.GameEvent;
import match3.ccs.Factories.CCSScreenFactory;
import match3.ccs.models.CCSUniverseData;
import match3.core.controllers.SystemController;
import match3.core.Enums.ServerCommand;
import match3.core.Factories.ScreenFactory;
import match3.core.models.LocationData;
import slavara.haxe.core.TypeDefs.DisplayObjectContainer;

/**
 * @author SlavaRa
 */
class CCSSystemController extends SystemController {

	public function new(container:DisplayObjectContainer) super(container, new CCSUniverseData());
	
	override function initializeListeners() {
		super.initializeListeners();
		
		container.addEventListener(GameEvent.RESET, onReset);
		container.addEventListener(GameEvent.GOTO_INTRO_SCREEN, onGotoIntroScreen);
		container.addEventListener(GameEvent.GOTO_WORLD_SCREEN, onGotoWorldScreen);
		container.addEventListener(GameEvent.GOTO_LOCATION_SCREEN, onGotoLocationScreen);
	}
	
	public override function getServerType():Class<Dynamic> return CCSServerController;
	
	public override function createScreenFactory():ScreenFactory return new CCSScreenFactory(cast(data, CCSUniverseData));
	
	public override function start() {
		super.start();
		cast(data, CCSUniverseData).stateMachine.setState(GameState.World);
	}
	
	function onReset(?_) server.send(ServerCommand.Reset);
	
	function onGotoIntroScreen(?_) cast(data, CCSUniverseData).stateMachine.setState(GameState.Intro);
	
	function onGotoWorldScreen(?_) cast(data, CCSUniverseData).stateMachine.setState(GameState.World);
	
	function onGotoLocationScreen(event:GameEvent) cast(data, CCSUniverseData).gotoLocation(cast(event.data, LocationData));
}