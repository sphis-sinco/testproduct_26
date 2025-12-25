package scenes;

import backend.ButtonAppearingAmountScene;

class Scene11Normal extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(5, 'Soon a number will appear, click the box that amount of', 'scene11n');

		onCompletion.add(function()
		{
			switchScene(new Scene12Normal());
		});
	}
}

class Scene11Impatient extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(4, 'Soon a number will appear, click the box that amount of', 'scene11i');

		onCompletion.add(function()
		{
			switchScene(new Scene12Impatient());
		});
	}
}


class Scene12Normal extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(8, 'Repeat', 'scene12n');

		onCompletion.add(function()
		{
			switchScene(new EndNormalV1());
		});
	}
}

class Scene12Impatient extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(7, 'Repeat', 'scene12i');

		onCompletion.add(function()
		{
			switchScene(new EndImpatientV1());
		});
	}
}
