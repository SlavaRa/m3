package match3.core.models.prototypes;
import flash.errors.ArgumentError;
import slavara.haxe.core.Models.Data;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class WorldProto extends LocationProto {
	
	public function new() super();
	
	public var id2location(default, null):Map<Int, LocationProto>;
	
	override function initialize() {
		super.initialize();
		id2location = new Map();
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		deserializeLocations(input);
	}
	
	@:noCompletion inline function deserializeLocations(input:Dynamic) {
		if(input.hasField("+locations")) {
			var locations:Array<Dynamic> = input.getProperty("+locations");
			for(it in locations) {
				var location = new LocationProto();
				location.readExternal(it);
				addChild(location);
			}
		}
	}
	
	override function addChildBefore(child:Data) {
		super.addChildBefore(child);
		
		if(child.is(LocationData)) {
			var location:LocationProto = cast(child, LocationProto);
			var id = location.id;
			if(id2location.exists(id)) {
				throw new ArgumentError('A LocationProto with id = ' + id + ' already exists.');
			}
			id2location.set(id, location);
		}
	}
}