package;

import backend.utils.ReflectUtils;
import scenes.v2.liedaboutassociation.NothingButAnInnocentCasualty;
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

	public static var startTime:Date;
	public static var lastTime:Date;

	public static var usrName = #if windows Sys.environment()["USERNAME"]; #elseif (linux || macos) Sys.environment()["USER"]; #else 'foad' #end

	override public function create()
	{
		super.create();

		#if PLAYTESTER
		increasedBuild = true;
		#end

		reloadScenes();

		initSave();

		trace(Version.FULL);

		if (!Application.current.window.title.contains(Version.FULL))
			Application.current.window.title += ' (${Version.FULL})';

		readSave();
		FlxG.switchState(() -> new MainMenu());

		if (lastTime == null)
			lastTime = Date.now();

		
		var onDateExit = function(l)
		{
			trace('Closed after ${(Date.now().getTime() - InitState.lastTime.getTime()) / 1000}s');
		};

		if (!Application.current.onExit.has(onDateExit))
			Application.current.onExit.add(onDateExit);

		if (startTime == null)
			startTime = Date.now();
	}

	public static function switchToGameplay()
	{
		reloadScenes();

		trace('laststate: ' + Save.laststate);
		FlxG.switchState(() -> (lastSceneToClass.get(Save.laststate) ?? new Scene1()));
	}

	public static function initSave()
	{
		FlxG.save.bind('tepro', Application.current.meta.get('company'));
		// FlxG.save.mergeDataFrom('tepro', 'SPhis', true, true);

		var onSaveExit = function(l)
		{
			readSave();

			FlxG.save.flush();
		};

		if (!Application.current.onExit.has(onSaveExit))
			Application.current.onExit.add(onSaveExit);

		#if debug
		Save.build = null;
		Save.build = Version.BUILD;

		if (!increasedBuild)
		{
			increasedBuild = true;
			Save.build++;
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

		if (!Std.isOfType(Save.beat.v2, Dynamic))
			Save.beat.v2 = null;

		Save.beat.v2 ??= {};

		try
		{
			Reflect.setField(Save.beat.v2, 'associated', Reflect.field(Save.beat.v2, 'associated') ?? false);
			Reflect.setField(Save.beat.v2, 'unassociated', Reflect.field(Save.beat.v2, 'unassociated') ?? false);
			Reflect.setField(Save.beat.v2, 'liedAboutAssociation', Reflect.field(Save.beat.v2, 'liedAboutAssociation') ?? false);
		}
		catch (e)
		{
			trace('ur saves weird dude');
			trace(e);
		}

		if (Save.revertCount == null)
			Save.revertCount = 0;

		if (Save.laststate == null)
			Save.laststate = 'scene1';

		/*
			if (Save.firsttime == null)
				Save.firsttime = true;
			else
				Save.firsttime = false;
		 */

		var state = Std.string(Compiler.getDefine('STATE')).split("=")[0];
		if (state != null)
			Save.laststate = state;
	}

	public static function readSave()
	{
		trace('Save (${FlxG.save.path}/${FlxG.save.name})');

		ReflectUtils.forFieldInObject(FlxG.save.data, function(field)
		{
			trace(' * $field : ' + Reflect.field(FlxG.save.data, field));
		});
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
			'clickForKnowledge_bh' => new BeenHereKnowledge(),
			'clickForKnowledge_ur' => new UsedRevertKnowledge(),
			'clickForKnowledge_uf' => new YourFateKnowledge(),
			'innocentCasualty' => new NothingButAnInnocentCasualty(),
		];
		reloadingScenes = false;

		var scenes = [];
		for (key => value in lastSceneToClass)
			scenes.push(key);
		trace('Scene count: ' + (scenes.length + 1));
	}
}
