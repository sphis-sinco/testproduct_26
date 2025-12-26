package scenes.v2.associated;

import flixel.util.FlxTimer;
import backend.buttonscenes.ButtonScene;

class ClickIfYouDesireThis extends ButtonScene
{
	override public function new()
	{
		super('Click if you truely desire this.', 'desire');

		onLeftClick.add(function() {
            
        });
	}

	override function create()
	{
		super.create();

		FlxTimer.wait(4, function() {});
	}
}
