package match3.core.models;
import match3.core.Events.M3DataEvent;
import match3.core.models.behaviors.BehaviorCollectionData;
import match3.core.models.behaviors.IBehavior;
import slavara.haxe.core.models.Data.DataContainer;
using slavara.haxe.core.utils.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class M3Data extends DataContainer {

	public function new() {
		super();
		_behaviors = new BehaviorCollectionData();
	}
	
	var _behaviors:BehaviorCollectionData;
	var _behavior:IBehavior;
	
	public function setBehavior(type:BehaviorType) {
		var behavior = _behaviors.getBehavior(type);
		if(behavior == _behavior) {
			return;
		}
		if(_behavior.isNotNull()) {
			_behavior.reset();
		}
		_behavior = behavior;
		_behavior.release();
		if(willTrigger(M3DataEvent.BEHAVIOR_CHANE)) {
			dispatchEvent(new M3DataEvent(M3DataEvent.BEHAVIOR_CHANE, true));
		}
	}
}