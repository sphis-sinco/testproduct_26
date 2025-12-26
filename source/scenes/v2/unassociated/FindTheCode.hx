package scenes.v2.unassociated;

import scenes.v2.liedaboutassociation.FoundTheCode;
import menus.Kojn;
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
			if (!Save.kojnmemories?.contains('foundcode'))
			{
				Save.kojnmemories.push('foundcode');
				switchScene(new Kojn());

				Save.laststate = 'foundTheCode';
			}
			else
			{
				switchScene(new FoundTheCode());
			}
		});
	}
}
