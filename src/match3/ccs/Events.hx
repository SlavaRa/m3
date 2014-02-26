package match3.ccs;
import flash.events.Event;

/**
 * @author SlavaRa
 */
class GameEvent extends Event {
	
	public static inline var RESET = "reset";
	public static inline var GOTO_WORLD_SCREEN = "gotoWorldScreen";
	public static inline var GOTO_LOCATION_SCREEN = "gotoLocationScreen";
	
	public function new(type:String, ?bubbles:Bool, ?cancelable:Bool, ?data:Dynamic) {
		super(type, bubbles, cancelable);
		this.data = data;
	}
	
	public var data(default, null):Dynamic;
	
	public override function clone():Event return new GameEvent(type, bubbles, cancelable, data);
}