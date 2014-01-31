package match3.core.controllers;
import flash.display.Sprite;
import massive.munit.Assert;
import match3.core.controllers.SystemController;
using slavara.haxe.core.utils.Utils.DestroyUtil;

/**
 * @author SlavaRa
 */
class M3ControllerTest {

	public function new() { }
	
	var _controller:SystemController;
	
	@Before
	public function initialize() _controller = new SystemController(new Sprite());
	
	@Test
	public function initializeTest() {
		Assert.isNotNull(_controller.data);
		Assert.isNotNull(_controller.container);
	}
	
	@Test
	public function destroyTest() {
		DestroyUtil.destroy(_controller);
		Assert.isNull(_controller.data);
		Assert.isNull(_controller.container);
	}
}