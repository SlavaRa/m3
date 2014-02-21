package match3.ccs.display.screens;
import match3.core.models.WorldData;

/**
 * @author SlavaRa
 */
class WorldScreen extends EmptyScreen {

	public function new(world:WorldData) {
		super();
	}
	
	override function getDebugLabelText():String return "World screen";
}