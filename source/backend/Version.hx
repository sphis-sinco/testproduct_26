package backend;

import lime.utils.Assets;
import flixel.FlxG;

class Version
{
	public static var MAJOR(get, never):Null<Int>;

	static function get_MAJOR():Null<Int>
	{
		return 1;
	}

	public static var MINOR(get, never):Null<Int>;

	static function get_MINOR():Null<Int>
	{
		return 1;
	}

	public static var BUILD(get, never):Null<Int>;

	static function get_BUILD():Null<Int>
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

	public static var SUFFIX(get, never):String;

	static function get_SUFFIX():String
	{
		#if PLAYTESTER
		return ' [PLAYTESTER PROTOTYPE]';
		#end

		#if debug
		return ' [PROTOTYPE]';
		#end

		return '';
	}

	public static var FULL(get, never):String;

	static function get_FULL():String
	{
		return [#if VERSION_INCLUDE_MAJOR MAJOR, #end#if VERSION_INCLUDE_MINOR MINOR, #end BUILD].join('.') + SUFFIX;
	}
}
