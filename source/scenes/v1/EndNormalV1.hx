package scenes.v1;

import scenes.v2.V2Intro;
import haxe.crypto.Sha256;
import flixel.util.FlxColor;
import menus.MainMenu;
import flixel.FlxG;
import lime.app.Application;
import backend.buttonscenes.ButtonScene;

class EndNormalV1 extends ButtonScene
{
	override public function new()
	{
		super('Game over.\nHope you had some kind of fun.', 'endn_M1');

		onLeftClick.add(function()
		{
			if (FlxG.save.isBound)
				if (FlxG.save.data.beat != null)
					FlxG.save.data.beat.v1 = true;

			transitioning = true;
			FlxG.sound.play('assets/kojn/testproduct_5_aftermath.wav', 1, false, null, true, function()
			{
				switchScene(new V2Intro());
			});
		});

		clickText.visible = false;
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (transitioning)
			setCenterText(Sha256.encode('' + FlxG.random.int(0,255)));
	}
}
