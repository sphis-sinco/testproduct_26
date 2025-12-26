package scenes.v2.liedaboutassociation;

import flixel.util.FlxColor;
import lime.app.Application;
import menus.MainMenu;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;
import backend.buttonscenes.ButtonScene;

class NothingButAnInnocentCasualty extends ButtonScene
{
	override public function new()
	{
		super('Click if you are nothing but an innocent casualty.', 'innocentCasualty');

		onLeftClick.add(function()
		{
			setCenterText('Good.');
			ending();
		});

		clickText.visible = false;
	}

	override function create()
	{
		super.create();

		button.color = 0x282F52;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		// jonks time \ | /
		FlxTimer.wait(49.78, function()
		{
			setCenterText('Wrong answer ' + InitState.usrName);
			topText.text = "{}";

			ending();
		});
	}

	public function ending()
	{
		var imgs = ['foadDead', 'theyKilled', 'wrongplacewrongtime', 'i was in the way', 'news'];

		var randomShit:FlxSprite = new FlxSprite();
		members.insert(0, randomShit);

		var img = imgs[0];
		randomShit.loadGraphic('assets/cutscenes/innocentCasualty/$img.png');
		randomShit.screenCenter();

		FlxTween.tween(centerText, {alpha: 1}, 10, {
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

		button.visible = false;

		FlxG.sound.play('assets/cutscenes/innocentCasualty/testproduct_26_aftermath.wav', 1, false, null, true, function()
		{
			Save.beat.v2.liedAboutAssociation = true;

			Application.current.window.close();
		});
	}
}
