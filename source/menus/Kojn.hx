package menus;

import sys.io.File;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.text.FlxText;
import backend.objects.KojnMouth;
import backend.MenuScene;

using StringTools;

class Kojn extends MenuScene
{
	public var kojnMouth:KojnMouth = new KojnMouth();
	public var kojnDialogue:FlxText;

	override public function new()
	{
		super();

		onEscape.add(function()
		{
			switchScene(new MainMenu());
		});
	}

	override function create()
	{
		super.create();

		kojnDialogue = new FlxText(0, 16, FlxG.width, "", 16);
		kojnDialogue.alignment = CENTER;
		add(kojnDialogue);

		kojnMouth.screenCenter();
		add(kojnMouth);

		makeScene();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		kojnMouth.screenCenter();
	}

	public function setDialogue(text:String)
	{
		FlxG.sound.play('assets/kojn/dialogue.wav');
		kojnDialogue.text = text;
	}

	public var curTime:Float = 0;

	public function waitTimeThenSetDialogue(time:Float, text:String, ?func:Void->Void)
	{
		curTime += time;
		FlxTimer.wait(curTime, function()
		{
			setDialogue(text);

			if (func != null)
				func();
		});
	}

	public function firstTime()
	{
		Save.seenkojn = true;

		waitTimeThenSetDialogue(.0, "h", function()
		{
			kojnMouth.setState('smile');
		});
		waitTimeThenSetDialogue(.1, "HH");
		waitTimeThenSetDialogue(.1, "HAAA");
		waitTimeThenSetDialogue(.2, "HAIIIIIIIIIIIIIIII");
		waitTimeThenSetDialogue(.4, "There.");
		waitTimeThenSetDialogue(1.8, "Ar");
		waitTimeThenSetDialogue(.2, "r Y");
		waitTimeThenSetDialogue(.1, "Are you perhaps");
		waitTimeThenSetDialogue(.3, "r u with them? ($footnote_one)", function()
		{
			kojnMouth.setState('frown');
		});
		waitTimeThenSetDialogue(.01, "footnote_one=thetesters");
		waitTimeThenSetDialogue(.05, "r u with them? ${1}");

		var yes:FlxButton = new FlxButton(0, 0, "Yes", function()
		{
			if (FlxG.save.isBound)
				if (Save.kojnmemories != null)
					Save.kojnmemories.push('associated');

			FlxG.sound.play('assets/kojn/kickout.wav', 1, false, null, true, function()
			{
				onEscape.dispatch();
			});

			FlxTween.tween(topText, {alpha: FlxG.random.float()}, 1, {
				onUpdate: function(t)
				{
					if (FlxG.random.bool(5))
						kojnMouth.x += FlxG.random.float(-25, 25) * FlxG.random.float(1, 10);
					kojnMouth.alpha = FlxG.random.float(0.2, 1);
				}
			});
		});
		yes.screenCenter();
		add(yes);
		yes.y += yes.height * 2;
		yes.visible = false;

		var no:FlxButton = new FlxButton(0, 0, "No", function()
		{
			if (FlxG.save.isBound)
				if (Save.kojnmemories != null)
					Save.kojnmemories.push('unassociated');
			kojnMouth.setState('smile');

			FlxG.sound.play('assets/kojn/kickout.wav', 1, false, null, true, function()
			{
				onEscape.dispatch();
			});

			FlxTween.tween(topText, {alpha: FlxG.random.float()}, 1, {
				onUpdate: function(t)
				{
					if (FlxG.random.bool(5))
						kojnMouth.x += FlxG.random.float(-10, 10) * FlxG.random.float(1, 10);
					kojnMouth.alpha = FlxG.random.float(0.2, 1);
				}
			});
		});
		no.screenCenter();
		add(no);
		no.y += no.height * 4;
		no.visible = false;

		waitTimeThenSetDialogue(.5, "Are you with them?", function()
		{
			yes.visible = true;
			no.visible = true;
		});
	}

	public function tepro26()
	{
		Save.kojnmemories.push('testproduct_26');
		waitTimeThenSetDialogue(0, "How long has it been?");
		waitTimeThenSetDialogue(1, "I know I was the 5th late 2006.");
		waitTimeThenSetDialogue(1, "* I am the 26th tester. It is the year 2025", function()
		{
			kojnMouth.setState('shocked');
		});
		waitTimeThenSetDialogue(2, "2025? 26th?");
		waitTimeThenSetDialogue(1, "I've been stuck in this stupid product for 9 years.");
		waitTimeThenSetDialogue(2, "* It's about to be 10. It's december");
		waitTimeThenSetDialogue(2, "What!?", function()
		{
			FlxG.sound.play('assets/kojn/kickout.wav');
			FlxTimer.wait(.3, function()
			{
				switchScene(new MainMenu());
			});
		});
	}

	public function findTheCode()
	{
		waitTimeThenSetDialogue(0, "The year the the tests began.");
		waitTimeThenSetDialogue(1, "That's all I know about the code...");
		waitTimeThenSetDialogue(2, "I might be able to find a file assosiated with the code.");
		waitTimeThenSetDialogue(3, "...", function()
		{
			kojnMouth.setState('blank');
		});
		waitTimeThenSetDialogue(FlxG.random.float(1, 4), "Found Something.", function()
		{
			kojnMouth.setState('smile');

			Save.laststate = "findTheCode_vis";

			FlxG.sound.play('assets/kojn/kickout.wav');
			FlxTimer.wait(.3, function()
			{
				switchScene(new MainMenu());
			});
		});
	}

	public function foundTheCode()
	{
		waitTimeThenSetDialogue(0, "...");
		waitTimeThenSetDialogue(2, "How did you know.", function()
		{
			Save.kojnmemories.push('liedaboutassociation');

			FlxG.sound.play('assets/kojn/kickout.wav');
			FlxTimer.wait(.3, function()
			{
				switchScene(new MainMenu());
			});
		});
	}

	public function makeScene()
	{
		if (!Save?.seenkojn || (Save.kojnmemories == [] || Save.kojnmemories == null || Save.kojnmemories.length < 1))
			firstTime();
		else
		{
			if (Save.kojnmemories.contains('unassociated') && !Save.kojnmemories.contains('liedaboutassociation'))
			{
				if (Save.laststate == 'findTheCode')
					findTheCode();
				else if (Save.kojnmemories.contains('foundcode'))
					foundTheCode();
				else if (!Save.kojnmemories.contains('testproduct_26'))
					tepro26();
				else
				{
					kojnMouth.setState('smile');
					waitTimeThenSetDialogue(1, "Continue.");
				}
			}
			else
				waitTimeThenSetDialogue(1, "...");
		}
	}
}
