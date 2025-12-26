package scenes.v2.unassociated;

import menus.MainMenu;
import flixel.FlxG;
import backend.buttonscenes.ButtonCodeScene;

class FindTheCode extends ButtonCodeScene
{
	override public function new(laststateAppend:String = '')
	{
		super([2, 0, 0, 5], 'findTheCode' + laststateAppend);

		centerText.visible = false;

		onCompletion.add(function()
		{
			Save.kojnmemories.push('foundcode');

			switchScene(new MainMenu());
		});
	}
}
