package match3.core;
import flash.text.TextFormat;

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