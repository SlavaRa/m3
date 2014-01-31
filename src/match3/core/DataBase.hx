package match3.core;
import match3.core.models.UnitData;
import match3.core.models.UserData;
using Reflect;

/**
 * @author SlavaRa
 */
class DataBase extends UnitData {
	
	public function new() {
		super();
		addChild(user = new UserData());
	}
	
	public var user(default, null):UserData;
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("user")) {
			user.readExternal(input.getProperty('input'));
		}
	}
}