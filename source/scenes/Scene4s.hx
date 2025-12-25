package scenes;

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

	override public function new()
	{
		super('5 3 8 2', 'scene4n');

		tempResetButton = new FlxSprite();
		add(tempResetButton);
		tempResetButton.makeGraphic(128, 128);

		fullResetButton = new FlxSprite();
		add(tempResetButton);
		fullResetButton.makeGraphic(128, 128);

		tempResetText = new FlxText(0, 0, 0, "Counter Reset", 16);
        add(tempResetText);
        tempResetText.color = FlxColor.WHITE;

		fullResetText = new FlxText(0, 0, 0, "Code Reset", 16);
        add(fullResetText);
        fullResetText.color = FlxColor.WHITE;

        tempResetButton.screenCenter();
        fullResetButton.screenCenter();
        tempResetButton.x -= tempResetButton.width * 2;
        fullResetButton.x += fullResetButton.width * 2;

        tempResetText.setPosition(tempResetButton.x - (tempResetText.width / 2), tempResetButton.y + tempResetText.height);
        fullResetText.setPosition(fullResetButton.x - (fullResetText.width / 2), fullResetButton.y + fullResetText.height);
	}
}
