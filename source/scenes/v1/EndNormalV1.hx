package scenes.v1;

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

			switchScene(new MainMenu());
		});

		clickText.visible = false;
	}
}
