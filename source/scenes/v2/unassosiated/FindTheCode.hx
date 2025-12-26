package scenes.v2.unassosiated;

import flixel.FlxG;
import backend.buttonscenes.ButtonCodeScene;

class FindTheCode extends ButtonCodeScene
{
	override public function new(impatient:Bool)
	{
		super([2, 0, 0, 5], 'findTheCode' + ((impatient) ? '_ir' : '_nr'));

        centerText.visible = false;
	}
}
