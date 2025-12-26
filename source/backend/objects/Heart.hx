package backend.objects;

import flixel.FlxSprite;

class Heart extends FlxSprite
{
	override public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		loadGraphic('assets/heart.png');
	}
}
