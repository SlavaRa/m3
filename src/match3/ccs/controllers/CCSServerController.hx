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
			case ServerCommand.Reset: Log.trace("reset");
		}
	}
	
	function start() {
		var prototypes = "proto/";
		var ext = ".conf.js";
		Assets.loadText("@worlds/world_0".replace("@", prototypes) + ext, function(s) {
			var d:Dynamic = Json.parse(s);
			var locations:Array<Dynamic> = [];
			var locationsLinks:Array<String> = d.getProperty("locations");
			for(it in locationsLinks) {
				Assets.loadText(it.replace("@", prototypes) + ext, function(v) locations.push(Json.parse(v)));
			}
			d.deleteField("locations");
			d.setProperty("+locations", locations);
			dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, { "prototypes": { "world":d } } ));
		});
		
		var s = "{";
		s += "\"global\":{";
		s += "\"world\":{";
		s += "\"proto_id\":0,";
		s += "\"+locations\":[";
		s += "{\"id\":0,\"proto_id\":0, \"is_available\":1},";
		s += "{\"id\":1,\"proto_id\":0},";
		s += "{\"id\":2,\"proto_id\":0},";
		s += "{\"id\":3,\"proto_id\":0},";
		s += "{\"id\":4,\"proto_id\":0}";
		s += "]";
		s += "}";
		s += "}";
		s += "}";
		dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, Json.parse(s)));
	}
}