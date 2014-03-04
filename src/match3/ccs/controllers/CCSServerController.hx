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
			case ServerCommand.Reset: reset();
		}
	}
	
	function reset() Log.trace("IMPLEMENT ME");
	
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
			d = { "prototypes": { "world":d }};
			dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, d));
		});
		
		var d:Dynamic = {
			"global":{
				"world":{
					"proto_id":0,
					"+locations":[
						{"id":0,"proto_id":0, "is_available":1},
						{"id":1,"proto_id":0, "is_available":0},
						{"id":2,"proto_id":0, "is_available":0},
						{"id":3,"proto_id":0, "is_available":0},
						{"id":4,"proto_id":0, "is_available":0}
					]
				}
			}
		};
		dispatchEvent(new ServerControllerEvent(ServerControllerEvent.MESSAGE_RECEIVED, d));
	}
}