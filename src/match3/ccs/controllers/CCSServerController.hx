package match3.ccs.controllers;
import haxe.Json;
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
			case ServerCommand.Reset:
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
			s += "\"id\":" + d.getProperty("id") + ",";
			s += "\"desc\":\"" + d.getProperty("desc") + "\",";
			s += "\"+locations\":[";
			for(i in 0...locations.length) {
				var it = locations[i];
				Assets.loadText(it.replace("@", prototypes) + ext, if(i < locations.length - 1) {
					function(v) s += v + ",";
				} else {
					function(v) s += v;
				});
			}
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
		s += "{\"id\":0,\"proto_id\":0},";
		s += "{\"id\":1,\"proto_id\":0},";
		s += "{\"id\":2,\"proto_id\":0},";
		s += "{\"id\":3,\"proto_id\":0},";
		s += "{\"id\":4,\"proto_id\":0},";
		s += "{\"id\":5,\"proto_id\":0}";
		s += "]";
		s += "}";
		s += "}";
		s += "}";
		dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, Json.parse(s)));
	}
}