package match3.core.models;
import match3.core.models.prototypes.UnitProto;
import match3.core.models.prototypes.WorldProto;
import slavara.haxe.core.Models.Data;
using slavara.haxe.core.utils.Utils.ValidateUtil;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class WorldData extends LocationData {

	public function new(proto:WorldProto) super(proto);
	
	var _id2location:Map<Int, LocationData>;
	
	override function initialize() {
		super.initialize();
		
		_id2location = new Map();
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		deserializeLocations(input);
	}
	
	override function addChildBefore(child:Data) {
		super.addChildBefore(child);
		
		if(child.is(LocationData)) {
			var location:LocationData = cast(child, LocationData);
			var id = location.id;
			if(_id2location.exists(id)) {
				//TODO: throw error
			}
			_id2location.set(id, location);
		}
	}
	
	override function removeChildBefore(child:Data) {
		super.removeChildBefore(child);
		
		if(child.is(LocationData)) {
			var id = cast(child, LocationData).id;
			if(_id2location.exists(id)) {
				_id2location.remove(id);
			}
		}
	}
	
	@:final @:noCompletion inline function deserializeLocations(input:Dynamic) {
		var locations:Array<Dynamic> = null;
		if(input.hasField("locations")) {
			locations = input.getProperty("locations");
			if(input.hasField("+locations")) {
				locations = locations.concat(input.getProperty("+locations"));
			}
			input.setField("+locations", locations);
		}
		if(input.hasField("+locations")) {
			locations = input.getProperty("+locations");
			for(it in locations) {
				var location = new LocationData(null);
				location.readExternal(it);
				addChild(location);
			}
		}
		if(input.hasField("-locations")) {
			locations = input.getProperty("-locations");
			for(it in locations) {
				if(it.hasField("id")) {
					var id:Int = it.getProperty("id");
					if(_id2location.exists(id)) {
						removeChild(_id2location.get(id));
					}
				} else {
					//TODO: throw error
				}
			}
		}
		if(input.hasField("=locations")) {
			locations = input.getProperty("=locations");
			for(it in locations) {
				if(it.hasField("id")) {
					var id:Int = it.getProperty("id");
					if(_id2location.exists(id)) {
						_id2location.get(id).readExternal(it);
					}
				} else {
					//TODO: throw error
				}
			}
		}
	}
}