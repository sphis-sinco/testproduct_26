package menus;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.text.FlxText;
import backend.objects.KojnMouth;
import backend.MenuScene;

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

		makeScene();
	}

	public function setDialogue(text:String)
	{
		FlxG.sound.play('assets/kojn/dialogue.wav');
		kojnDialogue.text = text;
	}

	public var curTime:Float = 0;

	public function waitTimeThenSetDialogue(time:Float, text:String)
	{
		curTime += time;
		FlxTimer.wait(curTime, function()
		{
			setDialogue(text);
		});
	}

	public function makeScene()
	{
		if (!FlxG.save.data?.seenkojn)
		{
			FlxG.save.data.seenkojn = true;

			waitTimeThenSetDialogue(.0, "h");
			waitTimeThenSetDialogue(.1, "HH");
			waitTimeThenSetDialogue(.3, "HAAA");
			waitTimeThenSetDialogue(.8, "HAIIIIIIIIIIIIIIII");
			waitTimeThenSetDialogue(1.2, "There.");
			waitTimeThenSetDialogue(3, "Ar");
			waitTimeThenSetDialogue(3.2, "r Y");
			waitTimeThenSetDialogue(3.3, "Are you perhaps");
			waitTimeThenSetDialogue(3.6, "r u with them? ($footnote_one)");
			waitTimeThenSetDialogue(3.61, "footnote_one=thetesters");
			waitTimeThenSetDialogue(3.66, "r u with them? ${1}");
			waitTimeThenSetDialogue(3.7, "Are you with them?");
		}
		else {}
	}
}
