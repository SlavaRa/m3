package match3.core.models;
using Reflect;

/**
 * @author SlavaRa
 */
class WorldData extends UnitData {

	public function new() super();
	
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
}