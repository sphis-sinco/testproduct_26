package scenes;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxTimer;
import backend.ButtonScene;

class Scene1 extends ButtonScene
{
	override public function new()
	{
		super("Press the button", "scene1");

		onClick.add(function()
		{
			switchScene(new Scene2());
		});
		clickText.visible = false;
	}
}

class Scene2 extends ButtonScene
{
	override public function new()
	{
		super("Press the button 10 times", "scene2");

		onClick.add(function()
		{
			if (buttonClick == 10)
				switchScene(new Scene3());
		});
	}
}

class Scene3 extends ButtonScene
{
	public var greenButton:Bool = false;

	public var incorrect:String = "Incorrect. Your lack of patience will be noted.";

	override public function new()
	{
		super("Wait until green til click.", "scene3");

		onClick.add(function()
		{
			if (greenButton)
			{
				switchScene(new Scene1());
			}
			else
			{
				if (centerText.text != incorrect)
				{
					centerText.text = incorrect;

					FlxTimer.wait(1, function()
					{
						switchScene(new Scene1());
					});
				}
			}
		});

		FlxTimer.wait(FlxG.random.float(0, 5), function()
		{
			greenButton = true;
			trace('gren');
			button.color = FlxColor.LIME;
		});

		clickText.visible = false;
	}
}
