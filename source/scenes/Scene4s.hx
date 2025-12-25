package scenes;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import backend.ButtonScene;

class Scene4Normal extends ButtonScene
{
	public var tempResetButton:FlxSprite;
	public var fullResetButton:FlxSprite;

	public var tempResetText:FlxText;
	public var fullResetText:FlxText;

	public var code:Array<Int> = [];

	override public function new()
	{
		super('5 3 8 2', 'scene4n');

		tempResetButton = new FlxSprite();
		add(tempResetButton);
		tempResetButton.makeGraphic(128, 128);
		tempResetButton.color = FlxColor.GRAY;

		fullResetButton = new FlxSprite();
		add(fullResetButton);
		fullResetButton.makeGraphic(128, 128);
		fullResetButton.color = FlxColor.GRAY;

		tempResetText = new FlxText(0, 0, 0, "Counter Reset", 16);
		add(tempResetText);
		tempResetText.color = FlxColor.WHITE;

		fullResetText = new FlxText(0, 0, 0, "Code Reset", 16);
		add(fullResetText);
		fullResetText.color = FlxColor.WHITE;
		fullResetText.alignment = RIGHT;

		tempResetButton.screenCenter();
		fullResetButton.screenCenter();
		tempResetButton.x -= tempResetButton.width * 1.5;
		fullResetButton.x += fullResetButton.width * 1.5;

		tempResetText.setPosition(tempResetButton.x, tempResetButton.y + tempResetButton.height + tempResetText.height);
		fullResetText.setPosition(fullResetButton.x, fullResetButton.y + fullResetButton.height + fullResetText.height);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (btn in [fullResetButton, tempResetButton])
		{
			if (FlxG.mouse.overlaps(btn))
			{
				btn.scale.set(0.9, 0.9);

				if (FlxG.mouse.pressed)
				{
					btn.scale.set(0.8, 0.8);
				}
				if (FlxG.mouse.justReleased)
				{
					if (btn == tempResetButton)
					{
						code.push(buttonClick);
						buttonClick = 0;
					}
					if (btn == fullResetButton)
					{
						code = [];
						buttonClick = 0;
					}
				}
			}
			else
			{
				btn.scale.set(1, 1);
			}
		}

		tempResetButton.screenCenter();
		fullResetButton.screenCenter();
		tempResetButton.x -= tempResetButton.width * 1.5;
		fullResetButton.x += fullResetButton.width * 1.5;
	}
}
