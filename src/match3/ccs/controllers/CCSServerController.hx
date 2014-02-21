package match3.ccs.controllers;
import haxe.Json;
import haxe.Log;
import match3.core.controllers.ServerController;
import match3.core.Enums.ServerCommand;
import match3.core.Events.ServerControllerEvent;
import openfl.Assets;
import slavara.haxe.core.controllers.BaseController.IController;
using Reflect;
using StringTools;

/**
 * @author SlavaRa
 */
class CCSServerController extends ServerController {
	
	public function new(controller:IController) super(controller);
	
	public override function send(command:ServerCommand, ?data:Dynamic, ?onResponseReceived:Dynamic -> Void, ?onResponseSavedData:Dynamic) {
		switch (command) {
			case ServerCommand.Start: start();
			default:
		}
	}
	
	function start() {
		var prototypes = "prototypes/";
		var ext = ".conf.js";
		Assets.loadText("@worlds/world_0".replace("@", prototypes) + ext, function(s) {
			var d:Dynamic = Json.parse(s);
			var locations:Array<String> = d.getProperty("locations");
			
			s = "{";
			s += "\"prototypes\":{";
			s += "\"world\":{";
			s += "\"+locations\":[";
			for(it in locations) Assets.loadText(it.replace("@", prototypes) + ext, function(v) s += v);
			s += "]";
			s += "}";
			s += "}";
			s += "}";
			dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, Json.parse(s)));
		});
		
		var s = "{";
		s += "\"global\":{";
		s += "\"world\":{";
		s += "\"proto_id\":0,";
		s += "\"+locations\":[";
		s += "{\"proto_id\":0}";
		s += "]";
		s += "}";
		s += "}";
		s += "}";
		dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, Json.parse(s)));
	}
}