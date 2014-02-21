package match3.ccs.models;
import haxe.Log;
import match3.ccs.Enums.GameState;
import match3.core.DataBase;
import match3.core.models.LocationData;
import slavara.haxe.game.Models.DataCollection;
using Reflect;

/**
 * @author SlavaRa
 */
class CCSUniverse extends DataBase {
	public function new() {
		super();
	}
	
	override function initialize() {
		super.initialize();
		
		stateMachine.addAllToAll([GameState.Empty, GameState.World, GameState.Location]);
		stateMachine.setState(GameState.Empty);
	}
	
	private override function deserialize(input:Dynamic) {
		super.deserialize(input);
		
		var locations:DataCollection<LocationData> = world.getProperty("_locations");
		Log.trace(locations.numChildren);
	}
}