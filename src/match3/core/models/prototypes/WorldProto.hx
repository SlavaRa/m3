package match3.core.models.prototypes;
import match3.core.models.prototypes.PrototypesCollection;

/**
 * @author SlavaRa
 */
class WorldProto extends LocationProto {
	
	public function new() super();
	
	public var locations(default, null):PrototypesCollection<LocationProto>;
	public var rewards(default, null):PrototypesCollection<RewardProto>;
	
	override function initialize() {
		super.initialize();
		locations = new PrototypesCollection<LocationProto>("locations");
		rewards = new PrototypesCollection<RewardProto>("rewards");
	}
	
	override function deserialize(input:Dynamic) {
		super.deserialize(input);
		locations.readExternal(input);
		rewards.readExternal(input);
	}
}