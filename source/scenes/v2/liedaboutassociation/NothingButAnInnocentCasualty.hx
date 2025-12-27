package scenes.v2.liedaboutassociation;

import backend.InnocentCasualty;
import flixel.util.FlxColor;
import lime.app.Application;
import menus.MainMenu;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;
import backend.buttonscenes.ButtonScene;

class NothingButAnInnocentCasualty extends ButtonScene
{
	var runLeftClick = false;

	override public function new()
	{
		if (Save.laststate == 'clickForKnowledge_uf' || Save.laststate == 'innocentCasualty')
		{
			super('You\'ll have to do it eventually.', 'innocentCasualty');

			if (FlxG.random.bool(50))
				runLeftClick = true;
		}
		else
			super('Click if you are nothing but an innocent casualty.', 'innocentCasualty');

		onLeftClick.add(function()
		{
			if (FlxG.mouse.justReleased)
				setCenterText('Good.');
			else
				setCenterText('You\'ve forced our hand.');
			ending();
		});

		clickText.visible = false;
	}

	override function create()
	{
		super.create();

		button.color = 0x282F52;

		onEscape.add(function()
		{
			Save.laststate = "clickForKnowledge_uf";
		});

		// jonks speedrun time \ | /
		FlxTimer.wait(49.78, function()
		{
			setCenterText('Wrong answer ' + InitState.usrName);
			topText.text = "{}";

			ending();
		});

		if (runLeftClick)
			onLeftClick.dispatch();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.R)
			closeSubState();
	}

	public function ending()
	{
		button.visible = false;
		Save.beat.v2.liedAboutAssociation = true;

		new InnocentCasualty(this).run();
	}
}
