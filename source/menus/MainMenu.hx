package menus;

import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import backend.objects.Heart;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import backend.MenuScene;

class MainMenu extends MenuScene
{
	public var title:FlxText;

	public var play:FlxText;
	public var playBox:FlxSprite;

	public var reset:FlxText;
	public var resetBox:FlxSprite;

	public var kojn:Heart;

	public var selection:Int = 0;

	override function create()
	{
		super.create();

		title = new FlxText(0, 0, 0, "Tepro", 64);
		add(title);
		title.screenCenter();
		title.y -= title.height * 2;

		playBox = new FlxSprite();
		playBox.makeGraphic(#if debug 128, 128 #else 64, 64 #end);
		add(playBox);
		playBox.screenCenter();
		playBox.x -= playBox.width;

		play = new FlxText(0, 0, playBox.width, "Play", 16);
		add(play);
		play.color = FlxColor.BLACK;
		play.alignment = CENTER;

		resetBox = new FlxSprite();
		resetBox.makeGraphic(#if debug 128, 128 #else 64, 64 #end);
		add(resetBox);
		resetBox.screenCenter();
		resetBox.x += resetBox.width;

		reset = new FlxText(0, 0, resetBox.width, "Reset", 16);
		add(reset);
		reset.color = FlxColor.BLACK;
		reset.alignment = CENTER;

		kojn = new Heart();
		kojn.screenCenter(X);
		kojn.y = kojn.height;
		kojn.flipY = true;
		add(kojn);

		kojn.visible = FlxG.save.data?.beat?.v1 ?? false;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		#if debug
		if (FlxG.save.isBound)
			play.text = "Play\n(" + FlxG.save.data.laststate + ")";
		#end
		play.setPosition(playBox.x, playBox.y + (playBox.height / 2) - (play.height / 2));
		reset.setPosition(resetBox.x, resetBox.y + (resetBox.height / 2) - (reset.height / 2));

		if (!transitioning)
			for (button in [playBox, resetBox, kojn])
			{
				if (FlxG.mouse.overlaps(button) && button.visible)
				{
					button.scale.set(0.9, 0.9);

					if (FlxG.mouse.pressed)
						button.scale.set(0.8, 0.8);
					if (FlxG.mouse.justReleased)
					{
						playBlip();

						if (button == playBox)
							InitState.switchToGameplay();

						if (button == resetBox)
							FlxG.save.data.laststate = null;

						if (button == kojn)
						{
							transitioning = true;
							FlxG.sound.play('assets/kojn/testproduct_5_aftermath.wav', 1, false, null, true, function()
							{
								this.topText.text = 'you cant.';
								FlxTimer.wait(.1, function()
								{
									switchScene(new Kojn());
								});
							});

							FlxTween.tween(kojn, {y: (FlxG.height / 2) - (kojn.height / 2)}, 1, {
								ease: FlxEase.smootherStepIn,
								onUpdate: function(twn)
								{
									if (FlxG.random.bool(80))
									{
										title.y += FlxG.random.float(-10, 10);
										playBox.y += FlxG.random.float(-10, 10);
										resetBox.y += FlxG.random.float(-10, 10);
										topText.text = randomKojnText();
									}
								}
							});
						}
					}
				}
				else
					button.scale.set(1, 1);
			}
	}

	public function randomKojnText():String
	{
		var texts:Array<String> = [
			'teprod_5',
			'[[subject]] is ...',
			'DANGER',
			'STOP',
			'end',
			'... impatient.',
			'... rude',
			'... {overwrite_value="friendly"}'
		];

		return texts[FlxG.random.int(0, texts.length - 1)];
	}
}
