package match3.core;
import slavara.haxe.game.Models.UnknownProto;

/**
 * @author SlavaRa
 */
interface IPrototypesCollection {
	function get(id:Int):UnknownProto;
}

/**
 * @author SlavaRa
 */
interface IBehavior {
	function start():Void;
	function reset():Void;
}