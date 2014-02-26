package match3.core.display;
import match3.core.ViewFactory.ScreenFactory;
import slavara.haxe.core.Interfaces.IStateMachineHolder;
import slavara.haxe.core.TypeDefs.DisplayObject;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.Utils.DestroyUtil;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class ScreenView extends ResourceSprite {

	public function new(factory:ScreenFactory) {
		super();
		_factory = factory;
	}
	
	public var data(null, set):IStateMachineHolder;
	
	inline function set_data(value:IStateMachineHolder) {
		if(value != data) {
			if(data.isNotNull()) {
				data.stateMachine.reset();
			}
			
			data = value;
			
			if(data.isNotNull()) {
				_states = _factory.getScreens();
				data.stateMachine.onChange.add(updateState);
				updateState();
			}
		}
		return data;
	}
	
	var _factory:ScreenFactory;
	var _states:Map<EnumValue, DisplayObject>;
	
	public override function destroy() {
		super.destroy();
		data = null;
		_factory = null;
		_states = DestroyUtil.destroy(_states);
	}
	
	inline function updateState() {
		var smachine = data.stateMachine;
		if(smachine.previousState.isNotNull()) {
			removeChild(_states.get(smachine.previousState));
		}
		if(smachine.currentState.isNotNull()) {
			addChild(_states.get(smachine.currentState));
		}
	}
}