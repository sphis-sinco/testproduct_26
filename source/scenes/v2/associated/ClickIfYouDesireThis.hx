package scenes.v2.associated;

import backend.InnocentCasualty;
import flixel.util.FlxTimer;
import backend.buttonscenes.ButtonScene;

class ClickIfYouDesireThis extends ButtonScene
{
	override public function new()
	{
		super('Click if you truely desire this.', 'desire');

		onLeftClick.add(function()
		{
			button.visible = false;
			centerText.visible = false;
		});
	}

	override function create()
	{
		super.create();

		FlxTimer.wait(4, function()
		{
			button.visible = false;
			centerText.visible = false;
			new InnocentCasualty(this).run();

            Save.beat.v2.associatedBad = true;
		});
	}
}
