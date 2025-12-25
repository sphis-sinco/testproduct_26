package scenes;

import backend.ButtonAppearingAmountScene;

class Scene11Normal extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(5, 'Soon a number will appear, click the box that amount of times', 'scene11n');

		onCompletion.add(function()
		{
			switchScene(new EndNormalV1());
		});
	}
}

class Scene11Impatient extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(4, 'Soon a number will appear, click the box that amount of times', 'scene11i');

		onCompletion.add(function()
		{
			switchScene(new EndImpatientV1());
		});
	}
}
