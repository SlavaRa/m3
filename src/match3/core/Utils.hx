package match3.core;
import flash.events.TimerEvent;
import flash.text.TextFormat;
import flash.utils.Timer;
using slavara.haxe.core.Utils.ValidateUtil;

/**
 * @author SlavaRa
 */
class GlobalSecondTimer {
	
	_timer:Timer;
	
	public static function init() {
		if(_timer.isNotNull()) return;
		_timer = new Timer(60);
		_timer.start();
	}
	
	public static function addEventListener(type : String, listener : Dynamic -> Void, useCapture : Bool = false, priority : Int = 0, useWeakReference : Bool = false) {
		_timer.addEventListener(type, listener, useCapture, priority, useWeakReference);
	}
	
	public static function removeEventListener(type : String, listener : Dynamic -> Void, useCapture : Bool = false) {
		_timer.removeEventListener(type, listener, useCapture);
	}
}

/**
 * @author SlavaRa
 */
class GlobalMinuteTimer {
	
	_timer:Timer;
	
	public static function init() {
		if(_timer.isNotNull()) return;
		_timer = new Timer(1000);
		_timer.start();
	}
	
	public static function addEventListener(type : String, listener : Dynamic -> Void, useCapture : Bool = false, priority : Int = 0, useWeakReference : Bool = false) {
		_timer.addEventListener(type, listener, useCapture, priority, useWeakReference);
	}
	
	public static function removeEventListener(type : String, listener : Dynamic -> Void, useCapture : Bool = false) {
		_timer.removeEventListener(type, listener, useCapture);
	}
}

/**
 * @author SlavaRa
 */
extern class TextFieldUtils {
	public static inline function getServiceTextFormat():TextFormat {
		return new TextFormat("Arial", 16, 0x0080FF, false, false, false, null, null, null, 0, 0, 0, 0);
	}
	
	public static inline function getServiceButtonFormat():TextFormat {
		return new TextFormat("Arial", 12, 0x00AE00, false, false, false, null, null, null, 0, 0, 0, 0);
	}
}