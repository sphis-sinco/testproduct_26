package;

import backend.Version;
import sys.io.File;
import backend.Scene;
import scenes.Scene4s.Scene4Impatient;
import scenes.Scene4s.Scene4Normal;
import scenes.FirstFewScenes.Scene3;
import scenes.FirstFewScenes.Scene2;
import scenes.FirstFewScenes.Scene1;
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxState;

using StringTools;

class InitState extends FlxState
{
	public var lastSceneToClass:Map<String, FlxState> = [
		'scene2' => new Scene2(),
		'scene3' => new Scene3(),
		'scene4n' => new Scene4Normal(),
		'scene4i' => new Scene4Impatient(),
	];

	override public function create()
	{
		super.create();

		FlxG.save.bind('tepro', Application.current.meta.get('company'));

		Application.current.onExit.add(function(l)
		{
			FlxG.save.flush();
		});

		#if debug
		if (FlxG.save.data.build == null)
			FlxG.save.data.build = 0;

		FlxG.save.data.build++;

		#if sys
		var sysPath = Sys.programPath().substring(0, Sys.programPath().indexOf('\\export')).replace('\\', '/');
		sysPath += '/build.txt';
		File.saveContent(sysPath, '' + FlxG.save.data.build);
		#end
		#end

		trace(Version.FULL);

		trace('laststate: ' + FlxG.save.data.laststate);

		FlxG.switchState(() -> (lastSceneToClass.get(FlxG.save.data.laststate) ?? new Scene1()));
	}
}
