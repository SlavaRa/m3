package match3.core;
import flash.events.Event;
import slavara.haxe.core.events.models.DataBaseEvent;

/**
 * @author SlavaRa
 */
/**
 * @author SlavaRa
 */
class M3DataEvent extends DataBaseEvent {
	
	public static inline var BEHAVIOR_CHANE = "behaviorChane";
	
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false)	super(type, bubbles, cancelable);
}