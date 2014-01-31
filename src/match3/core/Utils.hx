package match3.core;
import flash.text.TextFormat;

/**
 * @author SlavaRa
 */
extern class TextFieldUtils {
	public static inline function getServiceTextFormat():TextFormat {
		return new TextFormat("Arial", 16, 0x0080FF, false, false, false, null, null, null, 0, 0, 0, 0);
	}
}