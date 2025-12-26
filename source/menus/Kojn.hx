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
					Save.kojnmemories.push('assosiated');

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
					Save.kojnmemories.push('unassosiated');
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

	public function makeScene()
	{
		if (!Save?.seenkojn || (Save.kojnmemories == [] || Save.kojnmemories == null || Save.kojnmemories.length < 1))
		{
			firstTime();
		}
		else
		{
			if (Save.laststate.startsWith('findTheCode_')) {}
			else
			{
				if (Save.kojnmemories.contains('unassosiated'))
				{
					kojnMouth.setState('smile');
					setDialogue("Continue.");
				}
				else
					setDialogue("...");
			}
		}
	}
}
