package backend;

import flixel.FlxG;

class ButtonRandomScene extends ButtonScene
{
	public var padding:Float = 0.0;
	public var buttonScaleOffset:Float = 0.0;

	override public function new(instruction:String, laststate:String, ?padding:Float = 0, ?buttonScaleOffset:Float = 0, ?buttonSize:Int = 128)
	{
		super(instruction, laststate, buttonSize);
		this.buttonScreenCenter = false;

		this.padding = padding;
		this.buttonScaleOffset = buttonScaleOffset;
	}

	override function create()
	{
		super.create();

		button.scale.set(1 - buttonScaleOffset, 1 - buttonScaleOffset);
        button.updateHitbox();
        
		button.setPosition(FlxG.random.float(padding, (FlxG.width - button.width) - padding),
			FlxG.random.float(padding, (FlxG.height - button.height) - padding));
	}
}
