package match3.core;
import match3.core.Enums.GameState;
import match3.core.models.PrototypesCollectionData;
import match3.core.models.UnitData;
import match3.core.models.UserData;
import match3.core.models.WorldData;
using Reflect;

/**
 * @author SlavaRa
 */
@:final class DataBase extends UnitData {
	
	public function new() super();
	
	public var prototypes(default, null):PrototypesCollectionData;
	public var world(default, null):WorldData;
	public var user(default, null):UserData;
	
	override function initialize() {
		super.initialize();
		
		prototypes = new PrototypesCollectionData();
		addChild(world = new WorldData());
		addChild(user = new UserData());
		
		stateMachine.setState(GameState.Empty);
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("prototypes")) {
			prototypes.readExternal(input.getProperty("prototypes"));
		}
		if(input.hasField("global")) {
			deserializeGlobal(input.getProperty("global"));
		}
	}
	
	inline function deserializeGlobal(input:Dynamic) {
		if(input.hasField("world")) {
			world.readExternal(input.getProperty("world"));
		}
		if(input.hasField("user")) {
			user.readExternal(input.getProperty('user'));
		}
	}
}