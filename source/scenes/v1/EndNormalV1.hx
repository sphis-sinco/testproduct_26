package scenes.v1;

import lime.app.Application;
import backend.ButtonScene;

class EndNormalV1 extends ButtonScene
{
	override public function new()
	{
		super('Game over.\nHope you had some kind of fun.', 'endn_M1');

		onLeftClick.add(function()
		{
			Application.current.window.close();
		});

		clickText.visible = false;
	}
}
