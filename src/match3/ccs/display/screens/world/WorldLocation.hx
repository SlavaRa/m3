package match3.ccs.display.screens.world;
import slavara.haxe.core.TypeDefs.DisplayObjectContainer;
import slavara.haxe.core.TypeDefs.ResourceSprite;
import slavara.haxe.core.TypeDefs.Sprite;
using Std;

/**
 * @author SlavaRa
 */
class WorldLocation extends ResourceSprite {
	
	public function new(asset:DisplayObjectContainer) super(asset);
	
	override function render():Bool {
		if(!super.render()) {
			return false;
		}
		
		asset.mouseChildren = false;
		asset.mouseEnabled = true;
		if(asset.is(Sprite)) {
			cast(asset, Sprite).buttonMode = true;
		}
		
		return true;
	}
}