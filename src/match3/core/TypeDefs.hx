package match3.core;
import match3.core.TypeDefs.UnitRawData;

/**
 * @author SlavaRa
 */
typedef UnitRawData = {
	id:Int,
	?desc:String
}

/**
 * @author SlavaRa
 */
typedef LocationRawData = {>UnitRawData,
	?behavior:String,
	?units:Array<Int>,
	?rewards:Array<Int>
}

/**
 * @author SlavaRa
 */
typedef WorldRawData = {>LocationRawData,
	?locations:Array<Dynamic>
}