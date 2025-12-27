package backend;

import flixel.text.FlxText;
import lime.app.Application;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxState;

class InnocentCasualty
{
	public var state:FlxState = null;

	public function new(state:FlxState)
	{
		this.state = state;
	}

	public function run():InnocentCasualty
	{
		if (state == null)
			return null;

		var imgs = ['foadDead', 'theyKilled', 'wrongplacewrongtime', 'i was in the way', 'news'];

		var randomShit:FlxSprite = new FlxSprite();
		state.members.insert(0, randomShit);

		var img = imgs[0];
		randomShit.loadGraphic('assets/cutscenes/innocentCasualty/$img.png');
		randomShit.screenCenter();

		FlxTween.tween(new FlxText(-100000000, -100000000, 0, 'ur mom', 16), {alpha: 1}, 10, {
			onUpdate: function(t)
			{
				img = imgs[FlxG.random.int(0, imgs.length - 1)];

				if (FlxG.random.bool(80))
				{
					randomShit.loadGraphic('assets/cutscenes/innocentCasualty/$img.png');
					randomShit.scale.set(FlxG.random.float(.1, 1.5), FlxG.random.float(.1, 1.5));
					randomShit.updateHitbox();
					randomShit.screenCenter();
					randomShit.color = FlxColor.fromRGBFloat(FlxG.random.int(0, 1), FlxG.random.int(0, 1), FlxG.random.int(0, 1));
				}
			}
		});

		FlxG.sound.play('assets/cutscenes/innocentCasualty/testproduct_26_aftermath.wav', 1, false, null, true, function()
		{
			Save.beat.v2.liedAboutAssociation = true;

			Application.current.window.close();
		});

		return this;
	}
}
