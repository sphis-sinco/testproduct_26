package scenes.v2.unassociated;

import menus.MainMenu;

class FindTheCodeVisibleCode extends FindTheCode
{
	override public function new()
	{
		super('_vis');

        centerText.visible = true;

		onCompletion.add(function()
		{
			switchScene(new MainMenu());
		});
	}
}
