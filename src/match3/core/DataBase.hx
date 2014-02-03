package match3.core;
import match3.core.Enums.GameState;
import match3.core.models.UnitData;
import match3.core.models.UserData;
import match3.core.models.WorldData;
import slavara.haxe.core.StateMachine;
using Reflect;

/**
 * @author SlavaRa
 */
class DataBase extends UnitData {
	
	public function new() super();
	
	public var stateMachine(default, null):StateMachine;
	public var world(default, null):WorldData;
	public var user(default, null):UserData;
	
	override function initialize() {
		super.initialize();
		
		stateMachine = new StateMachine();
		stateMachine.setState(GameState.Empty);
		
		addChild(world = new WorldData());
		addChild(user = new UserData());
	}
	
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