package match3.core;
import match3.core.Enums.GameState;
import match3.core.models.UnitData;
import match3.core.models.UserData;
import slavara.haxe.core.StateMachine;
using Reflect;

/**
 * @author SlavaRa
 */
class DataBase extends UnitData {
	
	public function new() super();
	
	public var stateMachine(default, null):StateMachine;
	public var user(default, null):UserData;
	
	override function initialize() {
		super.initialize();
		
		stateMachine = new StateMachine();
		stateMachine.setState(GameState.Empty);
		
		addChild(user = new UserData());
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("user")) {
			user.readExternal(input.getProperty('user'));
		}
	}
}