package match3.core.models.prototypes;

/**
 * @author SlavaRa
 */
class LocationProto extends UnitProto {

	public function new() super();
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.getProperty("+behavior")) {
			//TODO: implement me
		}
		if(input.getProperty("+units")) {
			//TODO: implement me
		}
		if(input.getProperty("+rewards")) {
			//TODO: implement me
		}
	}
}