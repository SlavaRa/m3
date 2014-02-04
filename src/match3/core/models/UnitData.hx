package match3.core.models;
import match3.core.DataBase;
import match3.core.Interfaces.IUnknown;
import slavara.haxe.core.events.models.DataBaseEvent;
import slavara.haxe.core.Models.DataValueObjectContainer;
import slavara.haxe.core.StateMachine;
using slavara.haxe.core.utils.Utils.ValidateUtil;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class UnitData extends DataValueObjectContainer implements IUnknown {

	function new() {
		super();
		initialize();
	}
	
	public var stateMachine(default, null):StateMachine;
	public var id(default, default):Int;
	public var desc(default, default):String;
	var _database:DataBase;
	
	function initialize() {
		stateMachine = new StateMachine();
		addEventListener(DataBaseEvent.ADDED, onAdded);
		addEventListener(DataBaseEvent.REMOVED, onRemoved);
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		if(input.hasField("id")) {
			id = input.getProperty("id");
		}
		if(input.hasField("desc")) {
			desc = input.getProperty("desc");
		}
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