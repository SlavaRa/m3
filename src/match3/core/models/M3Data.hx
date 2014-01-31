package match3.core.models;
using Reflect;

/**
 * @author SlavaRa
 */
class M3Data extends UnitData {
	
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