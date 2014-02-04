package match3.core;

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