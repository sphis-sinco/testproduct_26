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

		if (FlxG.save.isBound && laststate != null)
			FlxG.save.data.laststate = laststate;
	}

	override function create()
	{
		super.create();

		topText = new FlxText(0, 0, 0, Version.FULL + "\n");
		topText.alpha = 0.2;
		add(topText);
	}

	public function switchScene(scene:FlxState)
	{
		#if DONT_SWITCH
		return;
		#end

		transitioning = true;
		FlxG.switchState(() -> scene);
	}

	public function playBlip()
	{
		FlxG.sound.play('assets/sfx/selectBlip${FlxG.random.int(1, 3)}.wav');
	}
}
