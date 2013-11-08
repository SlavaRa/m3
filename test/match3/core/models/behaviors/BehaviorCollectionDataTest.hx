package match3.core.models.behaviors;
import haxe.Log;
import massive.munit.Assert;
import match3.core.models.behaviors.BehaviorCollectionData.BehaviorType;

/**
 * @author SlavaRa
 */
class BehaviorCollectionDataTest {

	public function new() {
	}
	
	@Test
	public function initializeTest() {
		var enums = Type.allEnums(BehaviorType);
		var data = new BehaviorCollectionData();
		
		Assert.areEqual(data.numChildren, enums.length);
		Assert.isTrue(Type.getClass(data.getBehavior(BehaviorType.Moving)) == MovingBehavior);
		Assert.isTrue(Type.getClass(data.getBehavior(BehaviorType.Rotating)) == RotatingBehavior);
		Assert.isTrue(Type.getClass(data.getBehavior(BehaviorType.Selecting)) == SelectingBehavior);
	}
}