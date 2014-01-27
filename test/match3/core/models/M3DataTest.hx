package match3.core.models;
import massive.munit.Assert;
import match3.core.models.behaviors.BehaviorCollectionData.BehaviorType;
import match3.core.models.behaviors.IBehavior;
import match3.core.models.behaviors.MovingBehavior;
import match3.core.models.behaviors.RotatingBehavior;
import match3.core.models.behaviors.SelectingBehavior;
import match3.core.models.M3Data;

/**
 * @author SlavaRa
 */
class M3DataTest {

	public function new() {}
	
	var _data:M3Data;
	
	@Before
	public function initialize() _data = new M3Data();
	
	@Test
	public function initializeTest() {
		Assert.isNull(Reflect.getProperty(_data, "_behavior"));
		Assert.isNotNull(_data.behaviors);
	}
	
	@Test
	public function setMovingBehaviorTest() {
		_data.setBehavior(BehaviorType.Moving);
		
		var behavior = Reflect.getProperty(_data, "_behavior");
		Assert.isNotNull(behavior);
		Assert.isTrue(Std.is(behavior, IBehavior));
		Assert.isTrue(Std.is(behavior, MovingBehavior));
	}
	
	@Test
	public function setRotationgBehaviorTest() {
		_data.setBehavior(BehaviorType.Rotating);
		
		var behavior = Reflect.getProperty(_data, "_behavior");
		Assert.isNotNull(behavior);
		Assert.isTrue(Std.is(behavior, IBehavior));
		Assert.isTrue(Std.is(behavior, RotatingBehavior));
	}
	
	@Test
	public function setSelectingBehaviorTest() {
		_data.setBehavior(BehaviorType.Selecting);
		
		var behavior = Reflect.getProperty(_data, "_behavior");
		Assert.isNotNull(behavior);
		Assert.isTrue(Std.is(behavior, IBehavior));
		Assert.isTrue(Std.is(behavior, SelectingBehavior));
	}
}