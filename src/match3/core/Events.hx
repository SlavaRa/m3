package match3.core;
import flash.events.Event;
import match3.core.Events.ControllerEvent;
import match3.core.Events.DataEvent;
import match3.core.Events.ServerControllerEvent;
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
class ServerControllerEvent extends ControllerEvent {
	
	public static inline var MESSAGE_RECEIVED = "messageReceived";
	
	public function new(type:String, ?cancelable:Bool, message:Dynamic) {
		super(type, cancelable);
		this.message = message;
	}
	
	public var message(default, null):Dynamic;
	
	public override function clone():Event return new ServerControllerEvent(type, cancelable, message);
}

/**
 * @author SlavaRa
 */
class ControllerEvent extends Event {
	
	public function new(type:String, ?cancelable:Bool) super(type, false, cancelable);
	
	public override function clone():Event return new ControllerEvent(type, cancelable);
}

