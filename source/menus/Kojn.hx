package menus;

import backend.MenuScene;

class Kojn extends MenuScene
{
	override public function new()
	{
        super();

		onEscape.add(function()
		{
			switchScene(new MainMenu());
		});
	}
}
