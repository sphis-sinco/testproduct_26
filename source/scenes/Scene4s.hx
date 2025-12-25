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
	public var codeText:FlxText;

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

		tempResetText = new FlxText(0, 0, 0, "Add Count", 16);
		add(tempResetText);
		tempResetText.color = FlxColor.WHITE;

		fullResetText = new FlxText(0, 0, 0, "Reset Code", 16);
		add(fullResetText);
		fullResetText.color = FlxColor.WHITE;
		fullResetText.alignment = RIGHT;

		tempResetButton.screenCenter();
		fullResetButton.screenCenter();
		tempResetButton.x -= tempResetButton.width * 1.5;
		fullResetButton.x += fullResetButton.width * 1.5;

		tempResetText.setPosition(tempResetButton.x, tempResetButton.y + tempResetButton.height + tempResetText.height);
		fullResetText.setPosition(fullResetButton.x, fullResetButton.y + fullResetButton.height + fullResetText.height);

		codeText = new FlxText();
		codeText.text = "16";
		codeText.size = 16;
		codeText.screenCenter();
		codeText.y -= codeText.height * 4;
		add(codeText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var codeTextCode:Array<String> = [];

		for (codeInt in code)
			codeTextCode.push('' + codeInt);

		while (codeTextCode.length < 4)
			codeTextCode.push('_');

		codeText.text = codeTextCode.join(" ");
		codeText.screenCenter(X);

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
