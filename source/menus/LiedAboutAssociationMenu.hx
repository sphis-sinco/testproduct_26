package menus;

import flixel.FlxG;
import flixel.text.FlxText;
import backend.MenuScene;

class LiedAboutAssociationMenu extends MenuScene
{
	public var randomMSGS:Array<String> = [
		'"They can no longer be trusted after these findings. What are they even doing with all those corpses ...',
		'MARCH 2026 ARTICLE : ...',
		'"Our reasons won\'t be understood"',
		'"It was for evolution."',
		'"They\'ll return. We\'ll be backc"',
		'35 corpses were found, ...',
		'"Since the companys founding in 2005 they\'ve been doing this?"',
		'In response to this incident a global wide technology limitation period will be issued in the coming weeks.',
		'"It\'s about time we focused on us and not the machines"',
	];

	override function create()
	{
		super.create();

		var repent:FlxText = new FlxText(0, 0, FlxG.width, '', 16);
		add(repent);

		repent.text = "Bad choice " + InitState.usrName;

		if (FlxG.random.bool(10))
			repent.text = randomMSGS[FlxG.random.int(0, randomMSGS.length - 1)];

		repent.alignment = CENTER;
		repent.screenCenter();
	}
}
