package backend;

import flixel.util.FlxColor;
import flixel.util.FlxSignal;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class ButtonScene extends Scene
{
	public var buttonClick:Int = 0;

	override public function new(instruction:String, laststate:String, ?buttonSize:Int = 128)
	{
		super(laststate);

		centerText = new FlxText(0, 0, 0, instruction, 16);

		button = new FlxSprite();
		button.makeGraphic(buttonSize, buttonSize);

		clickText = new FlxText(0, 0, 0, "This is a citizens murder", 16);
	}

	public var centerText:FlxText;
	public var clickText:FlxText;
	public var button:FlxSprite;

	public var onLeftClick:FlxSignal = new FlxSignal();
	public var onRightClick:FlxSignal = new FlxSignal();

	override function create()
	{
		add(button);
		add(centerText);
		add(clickText);

		centerText.screenCenter();
		centerText.y -= button.height;
		centerText.color = FlxColor.WHITE;
		setCenterText(centerText.text);

		button.screenCenter();
		button.color = FlxColor.RED;

		clickText.color = FlxColor.WHITE;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		clickText.text = '' + buttonClick;
		clickText.screenCenter();

		if (!transitioning && FlxG.mouse.overlaps(button) && button.visible)
		{
			button.scale.set(0.9, 0.9);

			if (FlxG.mouse.pressed)
			{
				button.scale.set(0.8, 0.8);
			}
			if (FlxG.mouse.justPressed)
			{
				playBlip();
				buttonClick++;
			}
			if (FlxG.mouse.justReleased)
			{
				onLeftClick.dispatch();
			}
			if (FlxG.mouse.justReleasedRight)
			{
				onRightClick.dispatch();
			}
		}
		else
		{
			button.scale.set(1, 1);
		}

		if (buttonScreenCenter)
			button.screenCenter();

		if (buttonClick < 0)
			buttonClick = 0;
	}

	var buttonScreenCenter = true;

	public static function decreaseButtonClick(buttonScene:ButtonScene)
	{
		buttonScene.buttonClick--;
	}

	public function setCenterText(text:String)
	{
		FlxG.sound.play('assets/sfx/dialogue.wav');
		centerText.text = text;
		centerText.screenCenter(X);
	}
}
