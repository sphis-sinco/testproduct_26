package menus;

import flixel.text.FlxText;
import backend.MenuScene;

class LiedAboutAssociationMenu extends MenuScene
{
	override function create()
	{
		super.create();

		var repent:FlxText = new FlxText();
		add(repent);

		repent.text = "Bad choice " + InitState.usrName;
		repent.screenCenter();
	}
}
