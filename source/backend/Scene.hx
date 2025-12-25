package backend;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class Scene extends FlxState
{
	public var transitioning:Bool = false;

	public var topText:FlxText;

	override public function new(laststate:String)
	{
		super();

		if (FlxG.save.isBound)
			FlxG.save.data.laststate = laststate;

		topText = new FlxText(0, 0, 0, "");
		topText.alpha = 0.2;
		add(topText);
	}

	public function switchScene(scene:FlxState)
	{
		transitioning = true;
		FlxG.switchState(() -> scene);
	}
}
