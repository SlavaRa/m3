package match3.ccs.models;
import match3.ccs.Enums.GameState;
import match3.core.DataBase;

/**
 * @author SlavaRa
 */
class CCSUniverse extends DataBase {

	public function new() super();
	
	override function initialize() {
		super.initialize();
		stateMachine.addAllToAll([GameState.Empty, GameState.World, GameState.Location]);
		stateMachine.setState(GameState.Empty);
	}
	
	public function gotoLocation(object) {
		
	}
}