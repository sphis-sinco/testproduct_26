package scenes;

import backend.ButtonAppearingAmountScene;

class Scene11Normal extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(5, 'Soon a number will appear, click the box that amount', 'scene11n');

		waitMax = 4.0;

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
		super(4, 'Soon a number will appear, click the box that amount', 'scene11i');
		
		waitMax = 3.0;

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

		waitMax = 8.0;

		onCompletion.add(function()
		{
			switchScene(new Scene13Normal());
		});
	}
}

class Scene12Impatient extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(7, 'Repeat', 'scene12i');
		
		waitMax = 6.0;

		onCompletion.add(function()
		{
			switchScene(new Scene13Impatient());
		});
	}
}

class Scene13Normal extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(15, '', 'scene13n');

		waitMax = 12.0;

		onCompletion.add(function()
		{
			switchScene(new Scene14Normal());
		});
	}
}

class Scene13Impatient extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(10, '', 'scene13i');
		
		waitMax = 10.0;

		onCompletion.add(function()
		{
			switchScene(new Scene14Impatient());
		});
	}
}

class Scene14Normal extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(20, '', 'scene14n');

		waitMax = 16.0;

		onCompletion.add(function()
		{
			switchScene(new EndNormalV1());
		});
	}
}

class Scene14Impatient extends ButtonAppearingAmountScene
{
	override public function new()
	{
		super(15, '', 'scene14i');
		
		waitMax = 15.0;

		onCompletion.add(function()
		{
			switchScene(new EndImpatientV1());
		});
	}
}
