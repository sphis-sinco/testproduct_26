package scenes.v2.liedaboutassociation;

import scenes.v2.liedaboutassociation.ClickForKnowledge.TheFailureKnowledge;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import menus.MainMenu;
import backend.objects.Heart;
import backend.buttonscenes.ButtonScene;
import backend.Scene;

class FoundTheCode extends ButtonScene
{
	public var them:Heart = new Heart();
	public var him:Heart = new Heart();
	public var us:Heart = new Heart();

	override public function new()
	{
		super('', 'foundTheCode');

		button.visible = false;
		centerText.visible = false;
        clickText.visible = false;

		onEscape.removeAll();

		onEscape.add(function()
		{
			if (him.alpha <= .5)
				switchScene(new TheFailureKnowledge());
			else
				switchScene(new MainMenu());
		});
	}

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
			FlxTween.tween(him, {alpha: 0}, 1);
			centerText.visible = true;

			setCenterText('He\'s a danger to us all.');

			FlxG.sound.play('assets/kojn/kickout.wav', 1, false, null, true, function()
			{
				onEscape.dispatch();
			});
		});
	}
}
