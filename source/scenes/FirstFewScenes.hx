package scenes;

import backend.ButtonScene;

class Scene1 extends ButtonScene
{
	override public function new()
	{
		super("Press the button");

		onClick.add(function()
		{
			switchScene(new Scene2());
		});
	}
}

class Scene2 extends ButtonScene
{
	override public function new()
	{
		super("Press the button 10 times");

		onClick.add(function()
		{
			if (buttonClick == 10)
				switchScene(new Scene1());
		});
	}
}
