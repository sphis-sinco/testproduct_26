package backend;

import subscenes.ResetSaveSubstate;
import flixel.util.FlxSignal;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class Scene extends FlxState
{
	public var transitioning:Bool = false;

	public var topText:FlxText;

	public var onEscape:FlxSignal = new FlxSignal();

	override public function new(laststate:String)
	{
		super();

		if (laststate != null && !InitState.reloadingScenes)
			Save.laststate = laststate;
	}

	override function create()
	{
		super.create();

		topText = new FlxText(0, 0, 0, Version.FULL + "\n");
		topText.alpha = 0.2;
		add(topText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.G)
			FlxG.openURL('https://github.com/sphis-sinco/testproduct_26/issues/new');
		if (FlxG.keys.justReleased.ESCAPE)
			onEscape.dispatch();
		if (FlxG.keys.justReleased.R)
		{
			trace('<user> I dont like this anymore');
			openSubState(new ResetSaveSubstate());
		}
	}

	public function switchScene(scene:FlxState)
	{
		#if DONT_SWITCH
		return;
		#end

		trace('scene swap at ${(Date.now().getTime() - InitState.startingTime.getTime()) / 1000}s');
		transitioning = true;
		FlxG.switchState(() -> scene);
	}

	public function playBlip()
	{
		FlxG.sound.play('assets/sfx/selectBlip${FlxG.random.int(1, 3)}.wav');
	}
}
