package match3.core.models;
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
	
	@:noCompletion var _id2location:Map<Int, LocationData>;
	
	override function initialize() {
		super.initialize();
		_id2location = new Map();
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		deserializeLocations(input);
	}
	
	@:noCompletion inline function deserializeLocations(input:Dynamic) {
		if(input.hasField("+locations")) {
			var proto:WorldProto = cast(_proto, WorldProto);
			var locations:Array<Dynamic> = input.getProperty("+locations");
			for(it in locations) {
				if(it.hasField("id")) {
					var id:Int = it.getProperty("id");
					var location = new LocationData(proto.id2location.get(id));
					location.readExternal(it);
					addChild(location);
				} else {
					//TODO: throw error
				}
			}
		}
		if(input.hasField("-locations")) {
			var locations:Array<Dynamic> = input.getProperty("-locations");
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
			var locations:Array<Dynamic> = input.getProperty("=locations");
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
}