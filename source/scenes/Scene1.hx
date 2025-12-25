package scenes;

import flixel.text.FlxText;
import backend.Scene;

class Scene1 extends Scene
{
	public var centerText:FlxText;

	override function create()
	{
		centerText = new FlxText(0, 0, 0, "Press the button.", 16);
        add(centerText);
	}
}
