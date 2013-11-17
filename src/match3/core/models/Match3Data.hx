package match3.core.models;
import match3.core.Match3DataEvent;
import match3.core.models.behaviors.BehaviorCollectionData;
import match3.core.models.behaviors.IBehavior;
import slavara.haxe.core.models.Data.DataContainer;
import slavara.haxe.core.utils.Validate;

/**
 * @author SlavaRa
 */
class Match3Data extends DataContainer {

	public function new() {
		super();
		behaviors = new BehaviorCollectionData();
	}
	
	public var behaviors(default, null):BehaviorCollectionData;
	
	var _behavior:IBehavior;
	
	public function setBehavior(type:BehaviorType) {
		var behavior = behaviors.getBehavior(type);
		if(behavior == _behavior) {
			return;
		}
		
		if(Validate.isNotNull(_behavior)) {
			_behavior.reset();
		}
		
		_behavior = behavior;
		_behavior.release();
		
		if(hasEventListener(Match3DataEvent.BEHAVIOR_CHANE)) {
			dispatchEvent(new Match3DataEvent(Match3DataEvent.BEHAVIOR_CHANE, true));
		}
	}
}