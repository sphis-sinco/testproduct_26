package;

import scenes.Scene4s.Scene4Normal;
import scenes.FirstFewScenes.Scene3;
import scenes.FirstFewScenes.Scene2;
import scenes.FirstFewScenes.Scene1;
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
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
		switch (FlxG.save.data.laststate)
		{
			case 'scene4n':
				FlxG.switchState(() -> new Scene4Normal());
			case 'scene3':
				FlxG.switchState(() -> new Scene3());
			case 'scene2':
				FlxG.switchState(() -> new Scene2());

			default:
				FlxG.switchState(() -> new Scene1());
		}
	}
}
