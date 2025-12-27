package scenes.v2.associated;

import backend.buttonscenes.ButtonScene;

class Revert extends ButtonScene
{
	override public function new()
	{
		super('Go to the menu. Revert to level 1. Something special will happen', 'revert');

        button.visible = false;
        centerText.screenCenter(Y);
	}
}
