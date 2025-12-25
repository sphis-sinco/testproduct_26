package scenes;

import scenes.v1.EndNormalV1;
import scenes.v1.EndImpatientV1;
import backend.ButtonCodeScene;

class Scene4Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([5, 3, 8, 2], 'scene4n');

		onCompletion.add(function()
		{
			switchScene(new EndNormalV1());
		});
	}
}

class Scene4Impatient extends ButtonCodeScene
{
	override public function new()
	{
		super([0, 1, 0, 1], 'scene4i');

		onCompletion.add(function()
		{
			switchScene(new EndImpatientV1());
		});
	}
}
