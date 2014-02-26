package match3.ccs.models;
import match3.ccs.Enums.GameState;
import match3.core.models.LocationData;
import match3.core.models.UniverseData;
import slavara.haxe.core.Errors.ArgumentNullError;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class CCSUniverseData extends UniverseData {

	public function new() super();
	
	override function initialize() {
		super.initialize();
		stateMachine.addAllToAll([GameState.Empty, GameState.World, GameState.Location]);
		stateMachine.setState(GameState.Empty);
	}
	
	public function gotoLocation(data:LocationData) {
		#if debug
		if(data.isNull()) throw new ArgumentNullError("data");
		#end
		world.currentLocation = data;
		stateMachine.setState(GameState.Location);
	}
}