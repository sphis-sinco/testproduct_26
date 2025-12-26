package scenes.v2.liedaboutassociation;

import menus.MainMenu;
import flixel.util.FlxTimer;
import backend.buttonscenes.ButtonScene;

class Knowledge
{
	public var instruction:String = '';

	public var clicked:Bool = false;

	public function new(instruction:String, ?hasClicked:Bool = false)
	{
		this.instruction = instruction;
		this.clicked = hasClicked;
	}

	public function copy():Knowledge
	{
		return new Knowledge(this.instruction, this.clicked);
	}
}

class ClickForKnowledge extends ButtonScene
{
	public static var theFailure:Knowledge = new Knowledge('Click if he told you about the failure');
	public static var usedRevert:Knowledge = new Knowledge('Click if you\'ve used the revert');
	public static var beenHere:Knowledge = new Knowledge('Click if you\'ve been here before.');

	override public function new(knowledge:Knowledge = null, ?append:String)
	{
		super(knowledge?.instruction ?? '', 'clickForKnowledge' + append);

		onLeftClick.add(function()
		{
			clickedOrWaited(true);
		});
		clickText.visible = false;
	}

	override function create()
	{
		super.create();

		FlxTimer.wait(4, function()
		{
			clickedOrWaited(false);
		});
	}

	public function clickedOrWaited(clicked:Bool = false) {}
}

class TheFailureKnowledge extends ClickForKnowledge
{
	override public function new()
	{
		super(ClickForKnowledge.theFailure, '_tf');
	}

	override function clickedOrWaited(clicked:Bool = false)
	{
		ClickForKnowledge.theFailure.clicked = clicked;
		if (Save.revertCount > 0)
			switchScene(new UsedRevertKnowledge());
		else
			switchScene(new NothingButAnInnocentCasualty());
	}
}

class UsedRevertKnowledge extends ClickForKnowledge
{
	override public function new()
	{
		super(ClickForKnowledge.usedRevert, '_ur');
	}

	override function clickedOrWaited(clicked:Bool = false)
	{
		ClickForKnowledge.usedRevert.clicked = clicked;

		if (!clicked)
		{
			setCenterText("Liar.");

			FlxTimer.wait(1, function()
			{
				switchScene(new BeenHereKnowledge());
			});
		}
		else
			switchScene(new BeenHereKnowledge());
	}
}

class BeenHereKnowledge extends ClickForKnowledge
{
	override public function new()
	{
		super(ClickForKnowledge.beenHere, '_bh');
	}

	override function clickedOrWaited(clicked:Bool = false)
	{
		ClickForKnowledge.beenHere.clicked = clicked;

		switchScene(new NothingButAnInnocentCasualty());
	}
}
