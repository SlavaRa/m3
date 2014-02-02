package match3.core.models;
using Reflect;

/**
 * @author SlavaRa
 */
class LocationData extends UnitData {

	public function new() super();
	
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