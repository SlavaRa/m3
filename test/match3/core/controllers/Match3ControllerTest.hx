package match3.core.controllers;
import flash.display.Sprite;
import massive.munit.Assert;
import match3.core.controllers.Match3Controller;
import slavara.haxe.core.utils.Destroyable.DestroyUtils;

/**
 * @author SlavaRa
 */
class Match3ControllerTest {

	public function new() {
	}
	
	@Test
	public function initializeTest() {
		var controller = new Match3Controller(new Sprite());
		
		Assert.isNotNull(controller.data);
		Assert.isNotNull(controller.container);
	}
	
	@Test
	public function destroyTest() {
		var controller = new Match3Controller(new Sprite());
		
		DestroyUtils.destroy(controller);
		Assert.isNull(controller.data);
		Assert.isNull(controller.container);
	}
}