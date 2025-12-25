package scenes;

import backend.ButtonRandomScene;

class Scene7Normal extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button', 'scene7n', 360, 0.4);

		onLeftClick.removeAll();
		onLeftClick.add(function()
		{
			switchScene(new Scene8Normal());
		});

		this.clickText.visible = false;
	}
}

class Scene7Impatient extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button', 'scene7i', 720, 0.25);

		onLeftClick.removeAll();
		onLeftClick.add(function()
		{
			switchScene(new Scene8Impatient());
		});

		this.clickText.visible = false;
	}
}

class Scene8Normal extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button, click it 4 times.', 'scene8n', 180, 0.6);

		onLeftClick.add(function()
		{
			if (buttonClick == 4)
				switchScene(new EndNormalV1());
		});
	}
}

class Scene8Impatient extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button, click it 2 times', 'scene8i', 560, 0.4);

		onLeftClick.add(function()
		{
			if (buttonClick == 2)
				switchScene(new EndImpatientV1());
		});
	}
}
