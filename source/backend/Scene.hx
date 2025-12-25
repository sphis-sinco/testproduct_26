package backend;

import flixel.FlxG;
import flixel.FlxState;

class Scene extends FlxState
{
	override public function new()
	{
		super();
	}

	public function switchScene(scene:FlxState)
	{
		FlxG.switchState(() -> scene);
	}
}
