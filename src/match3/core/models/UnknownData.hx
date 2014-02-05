package match3.core.models;
import match3.core.DataBase;
import match3.core.Interfaces.IUnknown;
import match3.core.models.prototypes.UnknownProto;
import slavara.haxe.core.Errors.NullArgumentError;
import slavara.haxe.core.events.models.DataBaseEvent;
import slavara.haxe.core.Models.DataValueObjectContainer;
import slavara.haxe.core.StateMachine;
using slavara.haxe.core.utils.Utils.ValidateUtil;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class UnknownData extends DataValueObjectContainer implements IUnknown {

	function new(proto:UnknownProto) {
		#if debug
		if(proto.isNull()) throw new NullArgumentError("proto");
		#end
		super();
		_proto = proto;
		initialize();
	}
	
	public var stateMachine(default, null):StateMachine;
	public var id(get, null):Int;
	public var desc(get, null):String;
	
	var _proto:UnknownProto;
	var _database:DataBase;
	
	@:final @:noCompletion function get_id():Int return _proto.id;
	
	@:final @:noCompletion function get_desc():String return _proto.desc;
	
	function initialize() {
		stateMachine = new StateMachine();
		addEventListener(DataBaseEvent.ADDED, onAdded);
		addEventListener(DataBaseEvent.REMOVED, onRemoved);
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		//TODO:
	}
	
	@:final @:noCompletion function onAdded(event:DataBaseEvent) {
		if(event.currentTarget != event.target) {
			return;
		}
		var parent = this.parent;
		while(parent.isNotNull()) {
			if(parent.is(DataBase)) {
				_database = cast(parent, DataBase);
				break;
			}
			parent = parent.parent;
		}
	}
	
	@:final @:noCompletion function onRemoved(event:DataBaseEvent) {
		if(event.currentTarget != event.target) {
			return;
		}
		_database = null;
	}
}