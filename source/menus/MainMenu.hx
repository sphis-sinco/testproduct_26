package menus;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import backend.MenuScene;

class MainMenu extends MenuScene
{
	public var title:FlxText;

	override function create()
	{
		super.create();

		title = new FlxText(0, 0, 0, "Tepro", 64);
		add(title);
		title.screenCenter();
		title.y -= title.height * 2;
		title.color = FlxColor.WHITE;
	}
}
