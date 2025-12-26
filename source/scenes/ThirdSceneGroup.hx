package scenes;

import scenes.Scene10Intermissions.Scene10NormalIntermission;
import scenes.FourthSceneGroup.Scene11Impatient;
import scenes.FourthSceneGroup.Scene11Normal;
import backend.buttonscenes.ButtonRandomScene;

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
			if (buttonClick >= 4)
				switchScene(new Scene9Normal());
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
			if (buttonClick >= 2)
				switchScene(new Scene9Impatient());
		});
	}
}

class Scene9Normal extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button, click it 16 times.', 'scene9n', 0, 0.8);

		onLeftClick.add(function()
		{
			if (buttonClick >= 16)
				switchScene(new Scene10Normal());
		});
	}
}

class Scene9Impatient extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button, click it 6 times', 'scene9i', 280, 0.6);

		onLeftClick.add(function()
		{
			if (buttonClick >= 6)
				switchScene(new Scene10Impatient());
		});
	}
}

class Scene10Normal extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button, click it 20 times.', 'scene10n', 0, 0.95);

		onLeftClick.add(function()
		{
			if (buttonClick >= 20)
				switchScene(new Scene10NormalIntermission());
		});
	}
}

class Scene10Impatient extends ButtonRandomScene
{
	override public function new()
	{
		super('Find the button, click it 15 times', 'scene10i', 83, 0.8);

		onLeftClick.add(function()
		{
			if (buttonClick >= 15)
				switchScene(new Scene11Impatient());
		});
	}
}
