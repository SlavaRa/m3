package match3.core.models.prototypes;
import flash.errors.ArgumentError;
import slavara.haxe.core.Models.Data;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class WorldProto extends LocationProto {
	
	public function new() super();
	
	public var id2location(default, null):Map<Int, LocationProto>;
	public var id2reward(default, null):Map<Int, RewardProto>;
	
	override function initialize() {
		super.initialize();
		id2location = new Map();
		id2reward = new Map();
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		deserializeLocations(input);
		deserializeRewards(input);
	}
	
	@:noCompletion inline function deserializeLocations(input:Dynamic) {
		if(input.hasField("+locations")) {
			var locations:Array<Dynamic> = input.getProperty("+locations");
			for(it in locations) {
				var location = new LocationProto();
				location.readExternal(it);
				addChild(location);
			}
		}
	}
	
	@:noCompletion inline function deserializeRewards(input:Dynamic) {
		if(input.hasField("+rewards")) {
			var rewards:Array<Dynamic> = input.getProperty("+rewards");
			for(it in rewards) {
				var reward = new RewardProto();
				reward.readExternal(it);
				addChild(reward);
			}
		}
	}
	
	override function addChildBefore(child:Data) {
		super.addChildBefore(child);
		
		if(child.is(LocationProto)) {
			var location:LocationProto = cast(child, LocationProto);
			var id = location.id;
			if(id2location.exists(id)) {
				throw new ArgumentError('A LocationProto with id = ' + id + ' already exists.');
			}
			id2location.set(id, location);
			return;
		}
		
		if(child.is(RewardProto)) {
			var reward:RewardProto = cast(child, RewardProto);
			var id = reward.id;
			if(id2reward.exists(id)) {
				throw new ArgumentError('A RewardProto with id = ' + id + ' already exists.');
			}
			id2reward.set(id, reward);
			return;
		}
	}
}