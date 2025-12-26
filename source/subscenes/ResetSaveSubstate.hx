package subscenes;

import flixel.text.FlxText;
import backend.Subscene;

class ResetSaveSubstate extends Subscene
{
	public var omniMan:FlxText = new FlxText(0, 0, 0, "Are you sure?", 16);

	override function create()
	{
		super.create();

        omniMan.screenCenter();
        add(omniMan);
	}
}
