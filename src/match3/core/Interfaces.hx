package match3.core;

/**
 * @author SlavaRa
 */
interface IUnknown {
	public var id(default, default):Int;
	public var desc(default, default):String;
}

/**
 * @author SlavaRa
 */
interface IBehavior {
	function start():Void;
	function reset():Void;
}