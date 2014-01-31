package match3.core.controllers;
import flash.display.DisplayObjectContainer;
import match3.core.models.M3Data;
import slavara.haxe.core.controllers.BaseController;

/**
 * @author SlavaRa
 */
class SystemController extends BaseController {
	
	public function new(container:DisplayObjectContainer) super(container, new M3Data());
	
	public var server(default, null):ServerController;
	public var sound(default, null):SoundController;
	public var stat(default, null):StatController;
	public var user(default, null):UserController;
	
	public override function initialize() {
		super.initialize();
		
		server = new ServerController(this);
		sound = new SoundController(this);
		stat = new StatController(this);
		user = new UserController(this);
	}
}