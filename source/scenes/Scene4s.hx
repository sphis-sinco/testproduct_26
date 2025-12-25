package scenes;

import backend.ButtonCodeScene;

class Scene4Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([5, 3, 8, 2], 'scene4n');
	}
}

class Scene4Impatient extends ButtonCodeScene
{
	override public function new()
	{
		super([0, 1, 0, 1], 'scene4i');
	}
}
