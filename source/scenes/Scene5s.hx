package scenes;

import scenes.v1.EndNormalV1;
import scenes.v1.EndImpatientV1;
import backend.ButtonCodeScene;

class Scene5Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([8, 3, 4, 2, 9, 2, 4, 10], 'scene5n');

		onCompletion.add(function()
		{
			switchScene(new EndNormalV1());
		});
	}
}

class Scene5Impatient extends ButtonCodeScene
{
	override public function new()
	{
		super([2, 1, 0, 1, 3, 2], 'scene5i');

		onCompletion.add(function()
		{
			switchScene(new EndImpatientV1());
		});
	}
}
