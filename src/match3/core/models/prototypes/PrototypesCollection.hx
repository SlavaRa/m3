package match3.core.models.prototypes;
import flash.errors.ArgumentError;
import match3.core.Interfaces.IPrototypesCollection;
import slavara.haxe.core.Errors.ArgumentNullError;
import slavara.haxe.core.Models.Data;
import slavara.haxe.core.Models.DataValueObjectContainer;
import slavara.haxe.game.Models.UnknownProto;
using slavara.haxe.core.utils.Utils.StringUtil;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
@:generic class PrototypesCollection<T:({public function new():Void;},UnknownProto)> extends DataValueObjectContainer implements IPrototypesCollection {
	
	public function new(inputKey:String) {
		#if debug
		if(inputKey.isNullOrEmpty()) throw new ArgumentNullError("inputKey");
		#end
		super();
		_t = Type.getClass(new T());
		_id2t = new Map();
		_addKey = "+" + inputKey;
	}
	
	var _t:Class<T>;
	var _id2t:Map<Int, T>;
	var _addKey:String;
	
	public function get(id:Int):T return _id2t.exists(id) ? _id2t.get(id) : null;
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField(_addKey)) {
			var list:Array<Dynamic> = input.getProperty(_addKey);
			for(it in list) {
				var proto:UnknownProto = new T();
				proto.readExternal(it);
				addChild(proto);
			}
		}
	}
	
	override function addChildBefore(child:Data) {
		super.addChildBefore(child);
		
		if(child.is(_t)) {
			var proto:T = cast child;
			var id = proto.id;
			if(_id2t.exists(id)) {
				throw new ArgumentError("A " + Type.typeof(proto) + " with id = " + id + " already exists.");
			}
			_id2t.set(id, proto);
			return;
		}
	}
}