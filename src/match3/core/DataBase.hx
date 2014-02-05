package match3.core;
import match3.core.Enums.GameState;
import match3.core.models.prototypes.UnknownProto;
import match3.core.models.prototypes.UserProto;
import match3.core.models.prototypes.WorldProto;
import match3.core.models.UnknownData;
import match3.core.models.UserData;
import match3.core.models.WorldData;
using Reflect;

/**
 * @author SlavaRa
 */
@:final class DataBase extends UnknownData {
	
	public function new() super(new PrototypesCollectionData());
	
	public var world(default, null):WorldData;
	public var user(default, null):UserData;
	
	override function initialize() {
		super.initialize();
		
		var prototypes:PrototypesCollectionData = cast(_proto, PrototypesCollectionData);
		
		addChild(world = new WorldData(prototypes.world));
		addChild(user = new UserData(prototypes.user));
		
		stateMachine.setState(GameState.Empty);
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("prototypes")) {
			_proto.readExternal(input.getProperty("prototypes"));
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

/**
 * @author SlavaRa
 */
private class PrototypesCollectionData extends UnknownProto {
	
	public function new() {
		super();
		addChild(world = new WorldProto());
		addChild(user = new UserProto());
	}
	
	public var world(default, null):WorldProto;
	public var user(default, null):UserProto;
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("world")) {
			world.readExternal(input.getProperty("world"));
		}
		if(input.hasField("user")) {
			user.readExternal(input.getProperty('user'));
		}
	}
}