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
	
	var _controller:Match3Controller;
	
	@Before
	public function initialize() _controller = new Match3Controller(new Sprite());
	
	@Test
	public function initializeTest() {
		Assert.isNotNull(_controller.data);
		Assert.isNotNull(_controller.container);
	}
	
	@Test
	public function destroyTest() {
		DestroyUtils.destroy(_controller);
		Assert.isNull(_controller.data);
		Assert.isNull(_controller.container);
	}
}