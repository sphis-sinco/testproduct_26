package backend.buttonscenes;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.text.FlxText;

class ButtonAppearingAmountScene extends ButtonScene
{
	public var amount:Int = 0;

	public var amountText:FlxText;

	public var waitMin:Float = 1.0;
	public var waitMax:Float = 16.0;

	public var wasClever:Bool = false;
	public var onCompletion:FlxSignal = new FlxSignal();

	override public function new(amount:Int, instruction:String, laststate:String, ?buttonSize:Int = 128)
	{
		super(instruction, laststate, buttonSize);

		this.amount = amount;

		amountText = new FlxText(0, 0, 0, '' + amount, 16);
		amountText.alpha = 0;

		amountText.setPosition(FlxG.random.float(100, FlxG.width - amountText.width - 100), FlxG.random.float(100, FlxG.height - amountText.height - 100));

		onLeftClick.add(function()
		{
			if (amountText.alpha < 1)
				wasClever = true;

			if (buttonClick == this.amount)
			{
				if (wasClever)
					cleverScene();
				else
					onCompletion.dispatch();
			}
		});
	}

	public function cleverScene()
	{
		setCenterText('Clever.');
		FlxTimer.wait(2, function()
		{
			onCompletion.dispatch();
		});
	}

	override function create()
	{
		super.create();

		var wait = FlxG.random.float(waitMin, waitMax);
		trace('wait: ' + wait);
		FlxTimer.wait(wait, function()
		{
			FlxTween.tween(amountText, {alpha: 1}, 1, {
				ease: FlxEase.sineInOut
			});
		});
		
		add(amountText);
	}
}
