package match3.core;
import flash.display.DisplayObjectContainer;
import match3.core.controllers.PanelsController;
import match3.core.controllers.ScreenController;
import match3.core.controllers.ServerController;
import match3.core.controllers.SoundController;
import match3.core.controllers.StatController;
import match3.core.controllers.UserController;
import match3.core.DataBase;
import match3.core.Enums.GameState;
import match3.core.Events.GameEvent;
import match3.core.Events.ServerControllerEvent;
import slavara.haxe.core.controllers.BaseController;
using Reflect;

/**
 * @author SlavaRa
 */
class SystemController extends BaseController {
	
	public function new(container:DisplayObjectContainer) super(container, new DataBase());
	
	public var server(default, null):ServerController;
	public var sound(default, null):SoundController;
	public var stat(default, null):StatController;
	public var user(default, null):UserController;
	public var screen(default, null):ScreenController;
	public var panels(default, null):PanelsController;
	
	public override function initialize() {
		super.initialize();
		initializeControllers();
		initializeListeners();
		startUp();
	}
	
	inline function initializeControllers() {
		server = new ServerController(this);
		sound = new SoundController(this);
		stat = new StatController(this);
		user = new UserController(this);
		screen = new ScreenController(this);
		panels = new PanelsController(this);
	}
	
	inline function initializeListeners() {
		server.addEventListener(ServerControllerEvent.MESSAGE_RECEIVED, this.onServerMessageReceived);
		
		container.addEventListener(GameEvent.GOTO_EMPTY_SCREEN, onGotoEmptyScreen);
		container.addEventListener(GameEvent.GOTO_WORLD_SCREEN, onGotoWorldScreen);
	}
	
	inline function startUp() {
		//cast(data, DataBase).stateMachine.setState(GameState.World);
	}
	
	function onServerMessageReceived(event:ServerControllerEvent) {
		var message:Dynamic = event.message;
		if(message.hasField("global")) {
			cast(data, DataBase).readExternal(message.getProperty("global"));
		}
	}
	
	function onGotoEmptyScreen(event:GameEvent) cast(data, DataBase).stateMachine.setState(GameState.Empty);
	
	function onGotoWorldScreen(event:GameEvent) cast(data, DataBase).stateMachine.setState(GameState.World);
	
}