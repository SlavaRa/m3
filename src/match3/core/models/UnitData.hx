package match3.core.models;
import match3.core.Interfaces.IUnknown;
import slavara.haxe.core.models.Data.DataContainer;

/**
 * @author SlavaRa
 */
class UnitData extends DataContainer implements IUnknown {

	public function new() super();
	
	public var id(default, default):Int;
	public var desc(default, default):String;
}