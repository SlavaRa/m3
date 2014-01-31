package match3.core.display;
import match3.core.DataBase;
import match3.core.display.screens.EmptyScreen;
import match3.core.display.screens.LevelScreen;
import match3.core.display.screens.WorldScreen;
import match3.core.Enums.GameState;
import slavara.haxe.core.TypeDefs.DisplayObject;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.utils.Utils.DestroyUtil;
import statemachine.StateMachine;
using slavara.haxe.core.utils.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class ScreenView extends ResourceSprite {

	public function new() super();
	
	public var data(null, set):DataBase;
	
	inline function set_data(value:DataBase) {
		if(value != data) {
			if(data.isNotNull()) {
				data.stateMachine.clear();
			}
			
			data = value;
			
			if(data.isNotNull()) {
				var smachine:StateMachine = data.stateMachine;
				smachine.addAllToAll([GameState.Empty, GameState.Level, GameState.World]);
				smachine.onChange.add(updateState);
			}
			
			updateState();
		}
		return data;
	}
	
	var _states:Map<EnumValue, DisplayObject>;
	var _stateMachine:StateMachine;
	
	public override function initialize() {
		super.initialize();
		initializeStates();
	}
	
	public override function destroy() {
		super.destroy();
		data = null;
		_states = DestroyUtil.destroy(_states, false);
	}
	
	inline function initializeStates() {
		_states = new Map();
		_states.set(GameState.Empty, new EmptyScreen());
		_states.set(GameState.World, new WorldScreen());
		_states.set(GameState.Level, new LevelScreen());
	}
	
	inline function updateState() {
		if(data.isNotNull()) {
			var smachine:StateMachine = data.stateMachine;
			if(smachine.previousState.isNotNull()) {
				removeChild(_states.get(smachine.previousState));
			}
			
			addChild(_states.get(smachine.currentState));
		}
	}
}