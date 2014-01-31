package match3.core.models;
import slavara.haxe.core.Models.DataValueObjectContainer;

/**
 * @author SlavaRa
 */
class M3Data extends DataValueObjectContainer {
	
	public function new() {
		super();
		addChild(user = new UserData());
	}
	
	public var user(default, null):UserData;
}