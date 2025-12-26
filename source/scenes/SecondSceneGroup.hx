package scenes;

import scenes.ThirdSceneGroup.Scene7Impatient;
import scenes.ThirdSceneGroup.Scene7Normal;
import backend.buttonscenes.ButtonCodeScene;

class Scene4Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([5, 3, 8, 2], 'scene4n');

		onCompletion.add(function()
		{
			switchScene(new Scene5Normal());
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
			switchScene(new Scene5Impatient());
		});
	}
}

class Scene5Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([8, 3, 4, 2, 9, 2, 4, 10], 'scene5n');

		onCompletion.add(function()
		{
			switchScene(new Scene6Normal());
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
			switchScene(new Scene6Impatient());
		});
	}
}

class Scene6Normal extends ButtonCodeScene
{
	override public function new()
	{
		super([10, 15, 20, 25], 'scene6n');

		onCompletion.add(function()
		{
			switchScene(new Scene7Normal());
		});
	}
}

class Scene6Impatient extends ButtonCodeScene
{
	override public function new()
	{
		super([4, 6, 3, 2], 'scene6i');

		onCompletion.add(function()
		{
			switchScene(new Scene7Impatient());
		});
	}
}
