package scenes.v2;

import scenes.v2.unassosiated.FindTheCode;
import menus.MainMenu;
import flixel.util.FlxTimer;
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

		onEscape.add(function()
		{
			if (Save.kojnmemories.contains('assosiated'))
				switchScene(new MainMenu());
			else if (Save.kojnmemories.contains('unassosiated'))
				switchScene(new FindTheCode(true));
			else
				switchScene(new MainMenu());
		});
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

		FlxG.sound.play('assets/cutscenes/M2intro/appear.wav');
		for (obj in [them, him, us])
		{
			add(obj);

			obj.alpha = 0;
			FlxTween.tween(obj, {alpha: 1}, 1);
		}

		FlxTimer.wait(2, function()
		{
			if (Save.kojnmemories.contains('assosiated'))
			{
				topText.text = '{overwrite_value="you know not what I do"}';

				them.x += them.width / 2;
				him.x += him.width / 2;

				us.x = them.x;
				us.y += us.height;
			}
			else if (Save.kojnmemories.contains('unassosiated'))
			{
				topText.text = '{overwrite_value="we will achieve revenge"}';

				them.x += them.width / 2;
				him.x += him.width / 2;

				us.x = him.x;
				us.y += us.height;
			}
			else
			{
				topText.text = '{overwrite_value="come find me"}';

				for (obj in [them, us])
					FlxTween.tween(obj, {alpha: 0}, 1);
			}

			FlxG.sound.play('assets/kojn/kickout.wav', 1, false, null, true, function()
			{
				onEscape.dispatch();
			});
		});
	}
}
