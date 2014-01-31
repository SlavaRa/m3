package match3.core.models;
import massive.munit.Assert;
import match3.core.models.behaviors.BehaviorCollectionData.BehaviorType;
import match3.core.models.behaviors.IBehavior;
import match3.core.models.behaviors.MovingBehavior;
import match3.core.models.behaviors.RotatingBehavior;
import match3.core.models.behaviors.SelectingBehavior;
import match3.core.DataBase;
using Reflect;
using Std;

/**
 * @author SlavaRa
 */
class M3DataTest {

	public function new() {}
	
	var _data:DataBase;
	
	@Before
	public function initialize() _data = new DataBase();
	
	@Test
	public function initializeTest() {
		Assert.isNull(_data.getProperty("_behavior"));
		Assert.isNotNull(_data.getProperty("_behaviors"));
	}
	
	@Test
	public function setMovingBehaviorTest() {
		_data.setBehavior(BehaviorType.Moving);
		
		var behavior:Dynamic = _data.getProperty("_behavior");
		Assert.isNotNull(behavior);
		Assert.isTrue(behavior.is(IBehavior));
		Assert.isTrue(behavior.is(MovingBehavior));
	}
	
	@Test
	public function setRotationgBehaviorTest() {
		_data.setBehavior(BehaviorType.Rotating);
		
		var behavior:Dynamic = _data.getProperty("_behavior");
		Assert.isNotNull(behavior);
		Assert.isTrue(behavior.is(IBehavior));
		Assert.isTrue(behavior.is(RotatingBehavior));
	}
	
	@Test
	public function setSelectingBehaviorTest() {
		_data.setBehavior(BehaviorType.Selecting);
		
		var behavior:Dynamic =_data.getProperty("_behavior");
		Assert.isNotNull(behavior);
		Assert.isTrue(behavior.is(IBehavior));
		Assert.isTrue(behavior.is(SelectingBehavior));
	}
}