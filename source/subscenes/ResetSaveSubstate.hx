package subscenes;

import flixel.FlxG;
import flixel.text.FlxText;
import backend.Subscene;

class ResetSaveSubstate extends Subscene
{
	public var omniMan:FlxText = new FlxText(0, 0, 0, "Are you sure?\n(Y/N)", 16);

	override function create()
	{
		super.create();

        omniMan.alignment = CENTER;
		omniMan.screenCenter();
		add(omniMan);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.Y)
		{
			FlxG.save.erase();
			FlxG.resetGame();

			InitState.startingTime = null;

			close();
		}

		if (FlxG.keys.justReleased.N)
		{
			close();
		}
	}
}
