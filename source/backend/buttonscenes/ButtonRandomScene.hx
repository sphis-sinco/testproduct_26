package backend.buttonscenes;

import flixel.FlxG;

class ButtonRandomScene extends ButtonScene
{
	public var padding:Float = 0.0;
	public var buttonScaleOffset:Float = 0.0;

	override public function new(instruction:String, laststate:String, ?padding:Float = 0, ?buttonScaleOffset:Float = 0, ?buttonSize:Int = 128)
	{
		super(instruction, laststate, buttonSize);
		this.buttonScreenCenter = false;

		if (padding < button.width)
			padding = button.width;

		this.padding = padding;
		this.buttonScaleOffset = buttonScaleOffset;

		this.onLeftClick.add(function()
		{
			randomizeButtonPosition();
		});
	}

	override function create()
	{
		super.create();

		button.alpha = .5;
		button.scale.set(1 - buttonScaleOffset, 1 - buttonScaleOffset);
		button.updateHitbox();

		randomizeButtonPosition();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		this.clickText.screenCenter();

		if (!transitioning && FlxG.mouse.overlaps(button) && button.visible)
		{
			button.scale.set(0.9 - buttonScaleOffset, 0.9 - buttonScaleOffset);

			if (FlxG.mouse.pressed)
				button.scale.set(0.8 - buttonScaleOffset, 0.8 - buttonScaleOffset);
		}
		else
			button.scale.set(1 - buttonScaleOffset, 1 - buttonScaleOffset);
	}

	public function randomizeButtonPosition()
	{
		button.setPosition(FlxG.random.float(padding, (FlxG.width - (button.width * 2)) - padding),
			FlxG.random.float(padding, (FlxG.height - (button.height * 2)) - padding));

		if (button.x < 0)
			button.x = 0;
		if (button.x > FlxG.width - button.width * 2)
			button.x = FlxG.width - button.width * 2;
		if (button.y < 0)
			button.y = 0;
		if (button.y > FlxG.height - button.height * 2)
			button.y = FlxG.height - button.height * 2;
	}
}
