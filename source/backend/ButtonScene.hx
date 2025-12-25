package backend;

import flixel.util.FlxColor;
import flixel.util.FlxSignal;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class ButtonScene extends Scene
{
	public var buttonClick:Int = 0;

	override public function new(instruction:String, ?buttonSize:Int = 128)
	{
		super();

		centerText = new FlxText(0, 0, 0, instruction, 16);

		button = new FlxSprite();
		button.makeGraphic(buttonSize, buttonSize);

		clickText = new FlxText(0, 0, 0, "This is a citizens murder", 16);
	}

	public var centerText:FlxText;
	public var clickText:FlxText;
	public var button:FlxSprite;

	public var onClick:FlxSignal = new FlxSignal();

	override function create()
	{
		add(button);
		add(centerText);
		add(clickText);

		centerText.screenCenter();
		centerText.y -= button.height;
		centerText.color = FlxColor.WHITE;

		button.screenCenter();
		button.color = FlxColor.RED;

		clickText.color = FlxColor.WHITE;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		clickText.text = '' + buttonClick;
		clickText.screenCenter();

		if (FlxG.mouse.overlaps(button))
		{
			button.scale.set(0.75, 0.75);

			if (FlxG.mouse.justPressed)
			{
				buttonClick++;
			}
			if (FlxG.mouse.justReleased)
			{
				onClick.dispatch();
			}
		}
		else
		{
			button.scale.set(1, 1);
		}

		button.screenCenter();
	}
}
