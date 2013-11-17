package match3.core.models.behaviors;
import massive.munit.Assert;
import match3.core.models.behaviors.BehaviorCollectionData.BehaviorType;

/**
 * @author SlavaRa
 */
class BehaviorCollectionDataTest {

	public function new() { }
	
	static var _enums = Type.allEnums(BehaviorType);
	var _data:BehaviorCollectionData;
	
	@Before
	public function initialize() _data = new BehaviorCollectionData();
	
	@Test
	public function initializeTest() {
		Assert.areEqual(_data.numChildren, _enums.length);
		Assert.isTrue(Type.getClass(_data.getBehavior(BehaviorType.Moving)) == MovingBehavior);
		Assert.isTrue(Type.getClass(_data.getBehavior(BehaviorType.Rotating)) == RotatingBehavior);
		Assert.isTrue(Type.getClass(_data.getBehavior(BehaviorType.Selecting)) == SelectingBehavior);
	}
}