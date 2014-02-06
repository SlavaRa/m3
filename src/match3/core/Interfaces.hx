package match3.core;
import match3.core.models.prototypes.UnknownProto;

interface IPrototypesCollection {
	function get(id:Int):UnknownProto;
}

/**
 * @author SlavaRa
 */
interface IUnknown {
	public var id(get, null):Int;
	public var desc(get, null):String;
}

/**
 * @author SlavaRa
 */
interface IBehavior {
	function start():Void;
	function reset():Void;
}