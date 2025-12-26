package backend;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	public static var SCALE:Float = 6.0;

	public var scaleOffset:Float = 0.0;

	override public function new(?simpleGraphic:FlxGraphicAsset, ?scaleOffset:Float = 0.0, x:Float = 0, y:Float = 0)
	{
		super(x, y, simpleGraphic);

		this.scaleOffset = scaleOffset;
		resetScale();
	}

	public function resetScale()
	{
		scale.set(SCALE - scaleOffset, SCALE - scaleOffset);
		updateHitbox();
	}
}
