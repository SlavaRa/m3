package match3.core.models;
import match3.core.models.prototypes.UserProto;
using Reflect;

/**
 * @author SlavaRa
 */
class UserData extends UnknownData {

	public function new(proto:UserProto) super(proto);
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		//TODO:
	}
}