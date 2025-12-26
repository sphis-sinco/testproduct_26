package backend;

import flixel.FlxG;

class Save
{
	static function getField(field:String):Dynamic
	{
		if (!FlxG.save.isBound)
			return null;

		return Reflect.field(FlxG.save.data, field);
	}

	static function setField(field:String, set:Dynamic):Dynamic
	{
		if (FlxG.save.isBound)
			Reflect.setField(FlxG.save.data, field, set);

		return getField(field);
	}

	public static var beat(get, set):Dynamic;

	static function get_beat():Dynamic
		return getField('beat');

	static function set_beat(set:Dynamic):Dynamic
		return setField('beat', set);

	public static var seenkojn(get, set):Null<Bool>;

	static function get_seenkojn():Null<Bool>
		return getField('seenkojn');

	static function set_seenkojn(set:Null<Bool>):Null<Bool>
		return setField('seenkojn', set);

	public static var kojnmemories(get, set):Array<String>;

	static function get_kojnmemories():Array<String>
		return getField('kojnmemories');

	static function set_kojnmemories(set:Array<String>):Array<String>
		return setField('kojnmemories', set);

	public static var laststate(get, set):String;

	static function get_laststate():String
		return getField('laststate');

	static function set_laststate(set:String):String
		return setField('laststate', set);

	public static var build(get, set):Null<Int>;

	static function get_build():Null<Int>
		return getField('build');

	static function set_build(set:Null<Int>):Null<Int>
		return setField('build', set);
}
