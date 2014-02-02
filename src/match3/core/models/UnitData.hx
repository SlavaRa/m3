package match3.core.models;
import match3.core.Interfaces.IUnknown;
import slavara.haxe.core.Models.DataValueObjectContainer;
using Reflect;

/**
 * @author SlavaRa
 */
class UnitData extends DataValueObjectContainer implements IUnknown {

	public function new() super();
	
	public var id(default, default):Int;
	public var desc(default, default):String;
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("id")) {
			id = input.getProperty("id");
		}
		if(input.hasField("desc")) {
			desc = input.getProperty("desc");
		}
	}
}