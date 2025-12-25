package scenes;

import backend.ButtonRandomScene;

class Scene7Normal extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button', 'scene7n', 360, 0.4);

		onLeftClick.add(function()
		{
			switchScene(new Scene8Normal());
		});
	}
}

class Scene7Impatient extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button', 'scene7i', 720, 0.25);

		onLeftClick.add(function()
		{
			switchScene(new Scene8Impatient());
		});
	}
}

class Scene8Normal extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button', 'scene8n', 180, 0.6);

		onLeftClick.add(function()
		{
			switchScene(new EndNormalV1());
		});
	}
}

class Scene8Impatient extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button', 'scene8i', 560, 0.4);

		onLeftClick.add(function()
		{
			switchScene(new EndImpatientV1());
		});
	}
}
