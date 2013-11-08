package match3.core;

import flash.events.Event;
import slavara.haxe.core.events.models.DataBaseEvent;

/**
 * @author SlavaRa
 */
class Match3DataEvent extends DataBaseEvent {
	
	public static var BEHAVIOR_CHANE:String = "behaviorChane";
	
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false)	super(type, bubbles, cancelable);
}