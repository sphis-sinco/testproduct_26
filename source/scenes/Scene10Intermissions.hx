package scenes;

import scenes.FourthSceneGroup.Scene11Impatient;
import scenes.FourthSceneGroup.Scene11Normal;
import flixel.util.FlxTimer;
import backend.ButtonScene;

class Scene10NormalIntermission extends ButtonScene
{
	override public function new()
	{
		//                                  hm
		super('You\'ve done well.', 'scene10ni');

		button.visible = false;

		FlxTimer.wait(2, function()
		{
			setCenterText('Your patience is a skill.');
		});

		FlxTimer.wait(5, function()
		{
			setCenterText('Not many in these tests have it.');
		});

		FlxTimer.wait(9, function()
		{
			setCenterText('You are a unique case.');
		});

		FlxTimer.wait(11, function()
		{
			setCenterText('We hope to find your potential');
			button.visible = true;
		});

		onLeftClick.add(function()
		{
			switchScene(new Scene11Normal());
		});
	}
}

class Scene10ImpatientIntermission extends ButtonScene
{
	override public function new()
	{
		super('...', 'scene10ii');

		button.visible = false;

		FlxTimer.wait(2, function()
		{
			setCenterText('We shall keep it quick.');
		});

		FlxTimer.wait(4, function()
		{
			setCenterText('Your performance is typical and average.');
		});

		FlxTimer.wait(6, function()
		{
			setCenterText('We may conclude your test early.');
		});

		FlxTimer.wait(8, function()
		{
			setCenterText('But the highers above demand you a chance.');
		});

		FlxTimer.wait(10, function()
		{
			setCenterText('Do not waste the blessing of');
			button.visible = true;
		});

		onLeftClick.add(function()
		{
			switchScene(new Scene11Impatient());
		});
	}
}
