package;

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

		#if debug
		if (FlxG.save.data.build == null)
			FlxG.save.data.build = 0;
		
		FlxG.save.data.build++;
		trace(FlxG.save.data.build);
		#end

		FlxG.switchState(() -> new Scene1());
	}
}
