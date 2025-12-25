package backend;

import lime.utils.Assets;
import flixel.FlxG;

class Version
{
	public static var MAJOR(get, never):Int;

	static function get_MAJOR():Int
	{
		return 1;
	}

	public static var MINOR(get, never):Int;

	static function get_MINOR():Int
	{
		return 0;
	}

	public static var BUILD(get, never):Int;

	static function get_BUILD():Int
	{
		if (FlxG.save.isBound)
			if (FlxG.save.data.build != null)
				return cast FlxG.save.data.build;

		return try
		{
			Std.parseInt(Assets.getText('build.txt'));
		}
		catch (e)
		{
			0;
		};
	}

	public static var SUFFIX(get,never):String;

	static function get_SUFFIX():String
	{
		#if debug
		return ' [PROTOTYPE]';
		#end

		return '';
	}

	public static var FULL(get, never):String;

	static function get_FULL():String
	{
		return [MAJOR, MINOR, BUILD].join('.') + SUFFIX;
	}
}
