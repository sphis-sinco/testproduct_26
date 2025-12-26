package menus;

import backend.Sprite;
import lime.app.Application;
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

		reset = new FlxText(0, 0, resetBox.width, "Revert to Level 1", 16);
		add(reset);
		reset.color = FlxColor.BLACK;
		reset.alignment = CENTER;

		var tips = new FlxText(0, FlxG.height, 0, 'Anywhere:\n * Press "G" to report a bug\n * Press "R" to clear your save', 8);
		tips.alpha = .6;
		tips.y -= tips.height;
		add(tips);

		kojn = new Heart();
		kojn.screenCenter(X);
		kojn.y = 4;
		kojn.flipY = true;
		add(kojn);

		kojn.visible = Save.beat?.v1 ?? false;

		onEscape.add(function()
		{
			Application.current.window.close();
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		#if debug
		play.text = "Play\n(" + Save.laststate + ")";
		#end
		play.setPosition(playBox.x, playBox.y + (playBox.height / 2) - (play.height / 2));
		reset.setPosition(resetBox.x, resetBox.y + (resetBox.height / 2) - (reset.height / 2));

		if (!transitioning)
			for (button in [playBox, resetBox, kojn])
			{
				var ogScale = 1.0;
				var hoverOffset = 0.0;
				var pressOffset = 0.0;

				if (button == kojn)
				{
					hoverOffset = .1;
					pressOffset = .2;
					ogScale = Sprite.SCALE - kojn.scaleOffset;
				}

				if (FlxG.mouse.overlaps(button) && button.visible)
				{
					button.scale.set(ogScale - (.1 + hoverOffset), ogScale - (.1 + hoverOffset));

					if (FlxG.mouse.pressed)
						button.scale.set(ogScale - (.2 + pressOffset), ogScale - (.2 + pressOffset));
					if (FlxG.mouse.justReleased)
					{
						playBlip();

						if (button == playBox)
							InitState.switchToGameplay();

						if (button == resetBox)
							Save.laststate = null;

						if (button == kojn || (button == resetBox && Save.seenkojn && !Save.kojnmemories.contains('liedaboutassociation')))
						{
							transitioning = true;
							FlxG.sound.play('assets/kojn/testproduct_5_aftermath.wav', 1, false, null, true, function()
							{
								this.topText.text = 'you cant.';
								FlxTimer.wait(.1, function()
								{
									if (button == resetBox)
										FlxG.resetState();
									else
										switchScene(new Kojn());
								});
							});

							FlxTween.tween(kojn, {y: (FlxG.height / 2) - (kojn.height / 2)}, 1, {
								ease: FlxEase.smootherStepIn,
								onUpdate: function(twn)
								{
									if (FlxG.random.bool(80))
									{
										for (obj in members)
										{
											if (obj != topText)
											{
												Reflect.setProperty(obj, 'y',
													Reflect?.getProperty(obj, 'y') ?? 0 + FlxG.random.float(-10, 10) * FlxG.random.float(1, 10));
												Reflect.setProperty(obj, 'alpha', FlxG.random.float(0.2, 1));
											}
										}
										topText.text = randomKojnText();
									}
								}
							});
						}
					}
				}
				else
					button.scale.set(ogScale, ogScale);
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
