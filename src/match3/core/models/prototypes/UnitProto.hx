package match3.core.models.prototypes;
import match3.core.Interfaces.IUnknown;
import slavara.haxe.core.Models.DataValueObjectContainer;

/**
 * @author SlavaRa
 */
class UnitProto extends DataValueObjectContainer implements IUnknown {

	public function new() super();
	
	public var id(get, null):Int;
	public var desc(get, null):String;
	
	@:noCompletion var _id:Int;
	@:noCompletion var _desc:String;
	
	inline function get_id():Int return _id;
	
	inline function get_desc():String return _desc;
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("id")) {
			_id = input.getProperty("id");
		}
		if(input.hasField("desc")) {
			_desc = input.getProperty("desc");
		}
	}
}