package backend.utils;

class ReflectUtils
{
	public static function forFieldInObject(object:Dynamic, action:String->Void)
		for (field in Reflect.fields(object))
			action(field);
}
