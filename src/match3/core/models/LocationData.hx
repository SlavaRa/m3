package match3.core.models;
import match3.core.models.prototypes.LocationProto;
import match3.core.models.prototypes.UnitProto;
using Reflect;

/**
 * @author SlavaRa
 */
class LocationData extends UnitData {

	public function new(proto:LocationProto) super(proto);
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.getProperty("behavior")) {
			//TODO: implement me
		}
		if(input.getProperty("units")) {
			//TODO: implement me
		}
		if(input.getProperty("rewards")) {
			//TODO: implement me
		}
	}
}