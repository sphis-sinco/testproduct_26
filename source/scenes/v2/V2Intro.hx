package scenes.v2;

import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import backend.objects.Heart;
import flixel.FlxG;
import backend.Scene;

class V2Intro extends Scene
{
	public var impatientRoute:Bool = false;

	override public function new(impatientRoute:Bool = false)
	{
		super((impatientRoute) ? 'M2intro_ir' : 'M2intro_nr');

		this.impatientRoute = impatientRoute;
	}

	public var them:Heart = new Heart();
	public var him:Heart = new Heart();
	public var us:Heart = new Heart();

	override function create()
	{
		super.create();

		them.color = 0x282F52;
		him.flipY = true;
		us.color = 0xFFB566;

		them.screenCenter();
		them.x -= them.width;
		him.screenCenter();
		us.screenCenter();
		us.x += us.width;

		FlxG.sound.play('assets/cutscenes/M2intro.wav');
		for (obj in [them, him, us])
		{
			obj.alpha = 0;
            FlxTween.tween(obj, {alpha: 1}, 1);
		}
	}
}
