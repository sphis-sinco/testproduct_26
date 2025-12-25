package scenes;

import lime.app.Application;
import backend.ButtonScene;

class TheEnd extends ButtonScene
{
	override public function new()
	{
		super('Game over.\nHope you had some kind of fun.', null);

		onLeftClick.add(function()
		{
            Application.current.window.close();

            throw 'Bye.';
		});

		clickText.visible = false;
	}
}
