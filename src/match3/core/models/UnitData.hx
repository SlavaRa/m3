package match3.core.models;
import match3.core.Interfaces.IUnknown;
import slavara.haxe.core.Models.DataValueObjectContainer;

/**
 * @author SlavaRa
 */
class UnitData extends DataValueObjectContainer implements IUnknown {

	public function new() super();
	
	public var id(default, default):Int;
	public var desc(default, default):String;
}