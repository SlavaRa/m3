package match3.core.models.behaviors;
import match3.core.models.behaviors.BehaviorCollectionData.BehaviorType;
import slavara.haxe.core.models.Data;

/**
 * @author SlavaRa
 */
enum BehaviorType {
	Rotating;
	Moving;
	Selecting;
}

/**
 * @author SlavaRa
 * TODO: возможно проще сделать линкер который не позволит удалить модели поведений
 * TODO: рассмотреть реализацию before_addChild и after_removeChild
 */
class BehaviorCollectionData extends DataContainer {

	public function new() {
		super();
		super.addChildAt(new RotatingBehavior(), 0).name = BehaviorType.Rotating.getName();
		super.addChildAt(new MovingBehavior(), 1).name = BehaviorType.Moving.getName();
		super.addChildAt(new SelectingBehavior(), 2).name = BehaviorType.Selecting.getName();
	}
	
	public function getBehavior(type:BehaviorType):IBehavior {
		return cast(super.getChildByName(type.getName()), IBehavior);
	}
	
	@:final @:noCompletion public override function addChild(child:Data):Data {
		throw "метод запрещен";
		return null;
	}
	
	@:final @:noCompletion public override function addChildAt(child:Data, index:Int):Data {
		throw "метод запрещен";
		return null;
	}
	
	@:final @:noCompletion public override function removeChild(child:Data):Data {
		throw "метод запрещен";
		return null;
	}
	
	@:final @:noCompletion public override function removeChildAt(index:Int):Data {
		throw "метод запрещен";
		return null;
	}
	
	@:final @:noCompletion public override function removeChildren(beginIndex:Int = 0, ?endIndex:Int = -1) {
		throw "метод запрещен";
	}
	
	@:final @:noCompletion public override function getChildByName(name:String):Data {
		throw "метод запрещен";
		return null;
	}
	
	@:final @:noCompletion public override function getChildIndex(child:Data):Int {
		throw "метод запрещен";
		return -1;
	}
}