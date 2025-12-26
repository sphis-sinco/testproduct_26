package scenes.v1;

import flixel.FlxG;
import lime.app.Application;
import backend.buttonscenes.ButtonScene;

class EndImpatientV1 extends ButtonScene
{
	override public function new()
	{
		super('Game over.\nConsidering your impatience I doupt you had fun.', 'endi_M1');

		onLeftClick.add(function()
		{
			Application.current.window.close();
		});

		clickText.visible = false;
		
		FlxG.save.data.beat.v1 = true;
	}
}
