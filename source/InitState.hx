package;

import scenes.v2.liedaboutassociation.ClickForKnowledge;
import scenes.v2.liedaboutassociation.FoundTheCode;
import scenes.v2.unassociated.FindTheCodeVisibleCode;
import scenes.v2.unassociated.FindTheCode;
import scenes.v2.V2Intro;
import scenes.v1.Scene10Intermissions;
import scenes.v1.FirstSceneGroup;
import scenes.v1.SecondSceneGroup;
import scenes.v1.ThirdSceneGroup;
import scenes.v1.FourthSceneGroup;
import scenes.v1.EndV1;
import haxe.macro.Compiler;
import backend.Version;
#if sys
import sys.io.File;
#end
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxState;
import menus.MainMenu;

using StringTools;

class InitState extends FlxState
{
	public static var lastSceneToClass:Map<String, FlxState> = null;

	public static var increasedBuild:Bool = false;
	public static var reloadingScenes:Bool = false;

	public static var startingTime:Date;

	override public function create()
	{
		super.create();

		#if PLAYTESTER
		increasedBuild = true;
		#end

		reloadScenes();

		FlxG.save.bind('tepro', Application.current.meta.get('company'));
		FlxG.save.mergeDataFrom('tepro', 'SPhis');

		var onExit = function(l)
		{
			readSave();

			FlxG.save.flush();
		};

		if (!Application.current.onExit.has(onExit))
			Application.current.onExit.add(onExit);

		#if debug
		Save.build = null;
		Save.build = Version.BUILD;

		if (!increasedBuild)
		{
			increasedBuild = true;
			Save.build = Save.build += 1;
		}

		#if sys
		var sysPath = Sys.programPath().substring(0, Sys.programPath().indexOf('\\export')).replace('\\', '/');
		sysPath += '/build.txt';
		File.saveContent(sysPath, '' + Save.build);
		File.saveContent('build.txt', '' + Save.build);
		#end
		#end

		if (Save.beat == null)
			Save.beat = {};

		if (Save.seenkojn == null)
			Save.seenkojn = false;

		if (Save.kojnmemories == null)
			Save.kojnmemories = [];

		Save.beat.v1 ??= false;
		Save.beat.v2 ??= false;

		/*
			if (Save.firsttime == null)
				Save.firsttime = true;
			else
				Save.firsttime = false;
		 */

		var state = Std.string(Compiler.getDefine('STATE')).split("=")[0];
		if (state != null)
			Save.laststate = state;

		trace(Version.FULL);

		if (!Application.current.window.title.contains(Version.FULL))
			Application.current.window.title += ' (${Version.FULL})';

		readSave();
		FlxG.switchState(() -> new MainMenu());

		if (startingTime == null)
			startingTime = Date.now();
	}

	public static function switchToGameplay()
	{
		reloadScenes();

		trace('laststate: ' + Save.laststate);
		FlxG.switchState(() -> (lastSceneToClass.get(Save.laststate) ?? new Scene1()));
	}

	public static function readSave()
	{
		trace('Save (${FlxG.save.path}/${FlxG.save.name})');
		for (field in Reflect.fields(FlxG.save.data))
			trace(' * $field : ' + Reflect.field(FlxG.save.data, field));
	}

	public static function reloadScenes()
	{
		reloadingScenes = true;
		lastSceneToClass = [
			'scene2' => new Scene2(),
			'scene3' => new Scene3(),

			'scene4n' => new Scene4Normal(),
			'scene4i' => new Scene4Impatient(),
			'scene5n' => new Scene5Normal(),
			'scene5i' => new Scene5Impatient(),
			'scene6n' => new Scene6Normal(),
			'scene6i' => new Scene6Impatient(),

			'scene7n' => new Scene7Normal(),
			'scene7i' => new Scene7Impatient(),
			'scene8n' => new Scene8Normal(),
			'scene8i' => new Scene8Impatient(),
			'scene9n' => new Scene9Normal(),
			'scene9i' => new Scene9Impatient(),
			'scene10n' => new Scene10Normal(),
			'scene10i' => new Scene10Impatient(),

			'scene10ni' => new Scene10NormalIntermission(),
			'scene10ii' => new Scene10ImpatientIntermission(),

			'scene11n' => new Scene11Normal(),
			'scene11i' => new Scene11Impatient(),
			'scene12n' => new Scene12Normal(),
			'scene12i' => new Scene12Impatient(),
			'scene13n' => new Scene13Normal(),
			'scene13i' => new Scene13Impatient(),
			'scene14n' => new Scene14Normal(),
			'scene14i' => new Scene14Impatient(),

			'endn_M1' => new EndNormalV1(),
			'endi_M1' => new EndImpatientV1(),

			'M2intro_nr' => new V2Intro(false),
			'M2intro_ir' => new V2Intro(true),

			'findTheCode' => new FindTheCode(),
			'findTheCode_vis' => new FindTheCodeVisibleCode(),

			'foundTheCode' => new FoundTheCode(),
			// 'clickForKnowledge' => new ClickForKnowledge(),
			'clickForKnowledge_tf' => new TheFailureKnowledge(),
		];
		reloadingScenes = false;

		var scenes = [];
		for (key => value in lastSceneToClass)
			scenes.push(key);
		trace('Scene count: ' + (scenes.length + 1));
	}
}
