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

	public var reset:FlxText;
	public var resetBox:FlxSprite;

	public var selection:Int = 0;

	override function create()
	{
		super.create();

		title = new FlxText(0, 0, 0, "Tepro", 64);
		add(title);
		title.screenCenter();
		title.y -= title.height * 2;

		playBox = new FlxSprite();
		playBox.makeGraphic(#if debug 128, 128 #else 64, 64 #end);
		add(playBox);
		playBox.screenCenter();
		playBox.x -= playBox.width;

		play = new FlxText(0, 0, playBox.width, "Play", 16);
		add(play);
		play.color = FlxColor.BLACK;
		play.alignment = CENTER;

		resetBox = new FlxSprite();
		resetBox.makeGraphic(#if debug 128, 128 #else 64, 64 #end);
		add(resetBox);
		resetBox.screenCenter();
		resetBox.x += resetBox.width;

		reset = new FlxText(0, 0, resetBox.width, "Reset", 16);
		add(reset);
		reset.color = FlxColor.BLACK;
		reset.alignment = CENTER;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		#if debug
		if (FlxG.save.isBound)
			play.text = "Play\n(" + FlxG.save.data.laststate + ")";
		#end
		play.setPosition(playBox.x, playBox.y + (playBox.height / 2) - (play.height / 2));
		reset.setPosition(resetBox.x, resetBox.y + (resetBox.height / 2) - (reset.height / 2));

		if (!transitioning)
			for (button in [playBox, resetBox])
			{
				if (FlxG.mouse.overlaps(button))
				{
					button.scale.set(0.9, 0.9);

					if (FlxG.mouse.pressed)
						button.scale.set(0.8, 0.8);
					if (FlxG.mouse.justReleased)
					{
						if (button == playBox)
							InitState.switchToGameplay();

						if (button == resetBox)
							FlxG.save.data.laststate = null;
					}
				}
				else
					button.scale.set(1, 1);
			}
	}
}
