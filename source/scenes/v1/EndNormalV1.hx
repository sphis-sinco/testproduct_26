package scenes.v1;

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

			var repeat:Int = FlxG.random.int(1, 10);

			while (repeat > 0)
			{
				centerText.x += FlxG.random.int(-10, 10);
				centerText.y += FlxG.random.int(-10, 10);
				centerText.blend = MULTIPLY;
				centerText.color = FlxColor.fromRGBFloat(FlxG.random.float(0, 1), FlxG.random.float(0, 1), FlxG.random.float(0, 1), FlxG.random.float());
				add(centerText.clone());
				repeat--;

				if (repeat == 0)
				{
					switchScene(new MainMenu());
				}
			}
		});

		clickText.visible = false;
	}
}
