package match3.core;
import flash.events.Event;
import match3.core.Events.ControllerEvent;
import match3.core.Events.DataEvent;
import slavara.haxe.core.events.models.DataBaseEvent;

/**
 * @author SlavaRa
 */
class DataEvent extends DataBaseEvent {
	
	public static inline var BEHAVIOR_CHANE = "behaviorChane";
	
	public function new(type:String, ?bubbles:Bool, ?cancelable:Bool) super(type, bubbles, cancelable);
}

/**
 * @author SlavaRa
 */
class ControllerEvent extends Event {
	
	public function new(type:String, ?cancelable:Bool) super(type, false, cancelable);
	
	public override function clone():Event return new ControllerEvent(type, cancelable);
}