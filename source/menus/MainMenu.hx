package menus;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import backend.MenuScene;

class MainMenu extends MenuScene
{
	public var title:FlxText;

	public var play:FlxText;
	public var playBox:FlxSprite;

	public var selection:Int = 0;

	override function create()
	{
		super.create();

		title = new FlxText(0, 0, 0, "Tepro", 64);
		add(title);
		title.screenCenter();
		title.y -= title.height * 2;

		playBox = new FlxSprite();
		playBox.makeGraphic(64, 64);
		add(playBox);
		playBox.screenCenter();

		play = new FlxText(0, 0, 0, "Play", 16);
		add(play);
		play.screenCenter(X);
		play.y = playBox.getGraphicMidpoint().y - (play.height / 2);
		play.color = FlxColor.BLACK;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		playBox.color = (selection == 0) ? FlxColor.YELLOW : FlxColor.WHITE;

		if (!transitioning)
			for (button in [playBox])
			{
				if (FlxG.mouse.overlaps(button))
				{
					button.scale.set(0.9, 0.9);

					if (FlxG.mouse.pressed)
					{
						button.scale.set(0.8, 0.8);
					}
					if (FlxG.mouse.justReleased)
					{
						if (button == playBox)
						{
							InitState.switchToGameplay();
						}
					}
				}
				else
				{
					button.scale.set(1, 1);
				}

				button.screenCenter();
			}
	}
}
