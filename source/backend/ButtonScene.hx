package backend;

import flixel.util.FlxSignal;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class ButtonScene extends Scene
{
	public var buttonClicks:Int = 0;

	override public function new(instruction:String, ?buttonSize:Int = 128)
	{
		super();

		centerText = new FlxText(0, 0, 0, instruction, 16);

		button = new FlxSprite();
		button.makeGraphic(buttonSize, buttonSize);
	}

	public var centerText:FlxText;
	public var button:FlxSprite;

	public var onClicks:FlxSignal = new FlxSignal();

	override function create()
	{
		add(button);
		add(centerText);

		centerText.screenCenter();
		centerText.y -= button.height;
		button.screenCenter();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(button))
		{
			button.scale.set(0.75, 0.75);

			if (FlxG.mouse.justReleased)
			{
				buttonClicks++;
				onClicks.dispatch();
			}
		}
		else
		{
			button.scale.set(1, 1);
		}

		button.screenCenter();
	}
}
