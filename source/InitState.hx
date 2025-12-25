package;

import backend.Scene;
import scenes.Scene4s.Scene4Impatient;
import scenes.Scene4s.Scene4Normal;
import scenes.FirstFewScenes.Scene3;
import scenes.FirstFewScenes.Scene2;
import scenes.FirstFewScenes.Scene1;
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	public static var lastSceneToClass:Map<String, Scene> = [
		'scene2' => Scene2,
		'scene3' => Scene3,
		'scene4n' => Scene4Normal,
		'scene4i' => Scene4Impacient,
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
		#end

		if (FlxG.save.data.build != null)
			trace(FlxG.save.data.build);

		trace('laststate: ' + FlxG.save.data.laststate);

		FlxG.switchState(() -> (lastSceneToClass.get(FlxG.save.data.laststate) ?? Scene1));
	}
}
