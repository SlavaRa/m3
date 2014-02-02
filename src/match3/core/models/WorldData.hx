package match3.core.models;
import slavara.haxe.core.Models.Data;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class WorldData extends UnitData {

	public function new() super();
	
	public var id2location(default, null):Map<Int, LocationData>;
	
	override function initialize() {
		super.initialize();
		
		id2location = new Map();
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.getProperty("locations")) {
			//TODO: implement me
		}
		if(input.getProperty("=locations")) {
			//TODO: implement me
		}
		if(input.getProperty("-locations")) {
			//TODO: implement me
		}
		if(input.getProperty("+locations")) {
			//TODO: implement me
		}
	}
	
	override function addChildBefore(child:Data) {
		super.addChildBefore(child);
		
		if(child.is(LocationData)) {
			var location:LocationData = cast(child, LocationData);
			var id = location.id;
			if(id2location.exists(id)) {
				//TODO: throw error
			}
			id2location.set(id, location);
		}
	}
	
	override function removeChildBefore(child:Data) {
		super.removeChildBefore(child);
		
		if(child.is(LocationData)) {
			var id = cast(child, LocationData).id;
			if(id2location.exists(id)) {
				id2location.remove(id);
			}
		}
	}
}