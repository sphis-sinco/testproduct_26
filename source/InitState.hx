package;

import haxe.macro.Compiler;
import scenes.v1.EndImpatientV1;
import scenes.v1.EndNormalV1;
import scenes.Scene10Intermissions;
import scenes.ThirdSceneGroup;
import scenes.FourthSceneGroup;
import backend.Version;
#if sys
import sys.io.File;
#end
import scenes.FirstSceneGroup;
import scenes.SecondSceneGroup;
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxState;
import menus.MainMenu;

using StringTools;

class InitState extends FlxState
{
	static var lastSceneToClass:Map<String, FlxState> = null;

	public static var increasedBuild:Bool = false;

	override public function create()
	{
		super.create();

		#if PLAYTESTER
		increasedBuild = true;
		#end

		if (lastSceneToClass == null)
		{
			lastSceneToClass = [
				'scene2' => new Scene2(),
				'scene3' => new Scene3(),

				'scene4n' => new Scene4Normal(),
				'scene4i' => new Scene4Impatient(),
				'scene5n' => new Scene5Normal(),
				'scene5i' => new Scene5Impatient(),
				'scene6n' => new Scene6Normal(),
				'scene6i' => new Scene6Impatient(),

				'scene7n' => new Scene7Normal(),
				'scene7i' => new Scene7Impatient(),
				'scene8n' => new Scene8Normal(),
				'scene8i' => new Scene8Impatient(),
				'scene9n' => new Scene9Normal(),
				'scene9i' => new Scene9Impatient(),
				'scene10n' => new Scene10Normal(),
				'scene10i' => new Scene10Impatient(),

				'scene10ni' => new Scene10NormalIntermission(),
				'scene10ii' => new Scene10ImpatientIntermission(),

				'scene11n' => new Scene11Normal(),
				'scene11i' => new Scene11Impatient(),
				'scene12n' => new Scene12Normal(),
				'scene12i' => new Scene12Impatient(),
				'scene13n' => new Scene13Normal(),
				'scene13i' => new Scene13Impatient(),
				'scene14n' => new Scene14Normal(),
				'scene14i' => new Scene14Impatient(),

				'endn_M1' => new EndNormalV1(),
				'endi_M1' => new EndImpatientV1()
			];
		}

		FlxG.save.bind('tepro', Application.current.meta.get('company'));

		Application.current.onExit.add(function(l)
		{
			trace('Save');
			for (field in Reflect.fields(FlxG.save.data))
			{
				trace(' * $field : ' + Reflect.field(FlxG.save.data, field));
			}

			FlxG.save.flush();
		});

		#if debug
		FlxG.save.data.build = null;
		FlxG.save.data.build = Version.BUILD;

		if (!increasedBuild)
		{
			increasedBuild = true;
			FlxG.save.data.build++;
		}

		#if sys
		var sysPath = Sys.programPath().substring(0, Sys.programPath().indexOf('\\export')).replace('\\', '/');
		sysPath += '/build.txt';
		File.saveContent(sysPath, '' + FlxG.save.data.build);
		File.saveContent('build.txt', '' + FlxG.save.data.build);
		#end
		#end

		if (FlxG.save.data.beat == null)
			FlxG.save.data.beat = {};

		/*
			if (FlxG.save.data.firsttime == null)
				FlxG.save.data.firsttime = true;
			else
				FlxG.save.data.firsttime = false;
		 */

		var state = Std.string(Compiler.getDefine('STATE')).split("=")[0];
		if (state != null)
			FlxG.save.data.laststate = state;

		trace(Version.FULL);

		Application.current.window.title += ' (${Version.FULL})';

		FlxG.switchState(() -> new MainMenu());
	}

	public static function switchToGameplay()
	{
		trace('laststate: ' + FlxG.save.data.laststate);
		FlxG.switchState(() -> (lastSceneToClass.get(FlxG.save.data.laststate) ?? new Scene1()));
	}
}
