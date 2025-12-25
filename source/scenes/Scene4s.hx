package scenes;

import scenes.FirstFewScenes.Scene1;
import backend.ButtonCodeScene;

class Scene4Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([5, 3, 8, 2], 'scene4n');

		onCompletion.add(function()
		{
			switchScene(new Scene1());
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
			switchScene(new Scene1());
		});
	}
}
