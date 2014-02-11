package match3.core.models.prototypes;
import slavara.haxe.game.Models.UnknownProto;
using Reflect;

/**
 * @author SlavaRa
 */
class LocationProto extends UnknownProto {

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