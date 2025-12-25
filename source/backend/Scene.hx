package backend;

import flixel.FlxG;
import flixel.FlxState;

class Scene extends FlxState
{
	override public function new(laststate:String)
	{
		super();

		if (FlxG.save.isBound)
			FlxG.save.data.laststate = laststate;
	}

	public function switchScene(scene:FlxState)
	{
		FlxG.switchState(() -> scene);
	}
}
