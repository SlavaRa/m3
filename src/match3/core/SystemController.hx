package match3.core;
import match3.core.controllers.PanelsController;
import match3.core.controllers.ScreenController;
import match3.core.controllers.ServerController;
import match3.core.controllers.SoundController;
import match3.core.controllers.StatController;
import match3.core.controllers.UserController;
import match3.core.DataBase;
import match3.core.Enums.ServerCommand;
import match3.core.Events.ServerControllerEvent;
import match3.core.factories.ViewFactory.ScreenFactory;
import slavara.haxe.core.controllers.BaseController;
import slavara.haxe.core.TypeDefs.DisplayObjectContainer;
using Reflect;

/**
 * @author SlavaRa
 */
class SystemController extends BaseController {
	
	public function new(container:DisplayObjectContainer, data:DataBase) super(container, data);
	
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
		
		server.send(ServerCommand.Start);
	}
	
	public function getServerType():Class<Dynamic> return ServerController;
	
	public function createScreenFactory():ScreenFactory return new ScreenFactory();
	
	function initializeControllers() {
		server = Type.createInstance(getServerType(), [this]);
		sound = new SoundController(this);
		stat = new StatController(this);
		user = new UserController(this);
		screen = new ScreenController(this);
		panels = new PanelsController(this);
	}
	
	function initializeListeners() server.addEventListener(ServerControllerEvent.MESSAGE_RECEIVED, onServerMessageReceived);
	
	function onServerMessageReceived(event:ServerControllerEvent) cast(data, DataBase).readExternal(event.message);
}