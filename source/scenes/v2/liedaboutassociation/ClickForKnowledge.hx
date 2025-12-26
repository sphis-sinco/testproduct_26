package scenes.v2.liedaboutassociation;

import menus.MainMenu;
import flixel.util.FlxTimer;
import backend.buttonscenes.ButtonScene;

class Knowledge
{
	public var instruction:String = '';

	public function new(instruction:String)
	{
		this.instruction = instruction;
	}

	public function copy():Knowledge
	{
		return new Knowledge(this.instruction);
	}
}

class ClickForKnowledge extends ButtonScene
{
	public static var theFailure:Knowledge = new Knowledge('Click if he told you about the failure');

	public var currentKnowledge:Knowledge;

	override public function new(knowledge:Knowledge = null, ?append:String)
	{
		super(knowledge?.instruction ?? '', 'clickForKnowledge' + append);

		currentKnowledge = knowledge?.copy() ?? null;

		onLeftClick.add(function()
		{
			clickedOrWaited(true);
		});
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
		super.clickedOrWaited(clicked);
        
        switchScene(new MainMenu());
	}
}
