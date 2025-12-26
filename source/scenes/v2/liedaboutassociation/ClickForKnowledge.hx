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
        
        switchScene(new MainMenu());
	}
}
