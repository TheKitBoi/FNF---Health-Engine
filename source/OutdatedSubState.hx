package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		/*
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		// add(bg);
		
		var kadeLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('KadeEngineLogo'));
		kadeLogo.scale.y = 0.3;
		kadeLogo.scale.x = 0.3;
		kadeLogo.x -= kadeLogo.frameHeight;
		kadeLogo.y -= 180;
		kadeLogo.alpha = 0.8;
		// add(kadeLogo);
		*/
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Tutorial on how to go to credits "
			+ "\n "
			+ "\nThe first thing you have to do is be in the menu "
			+ "\nPress the key, d or the arrow right "
			+ "\nAnd voila, you can see the credits"
			+ "\n\nPress enter, to go to the menu and finish this tutorial",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(255, 255, 255), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);

		var infoSplash:FlxText = new FlxText(5, FlxG.height - 25, 0, "" + ('Yes, you want to have noteSplash activated go to: Options'), 12);
		infoSplash.scrollFactor.set();
		infoSplash.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		infoSplash.borderColor = FlxColor.BLACK;
		infoSplash.borderSize = 1;
		infoSplash.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(infoSplash);

		var infoOptions:FlxText = new FlxText(5, FlxG.height - 45, 0, "" + ('Press R, if you are going to disable or enable: NotesSplash'), 12);
		infoOptions.scrollFactor.set();
		infoOptions.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		infoOptions.borderColor = FlxColor.BLACK;
		infoOptions.borderSize = 1;
		infoOptions.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(infoOptions);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
			FlxG.sound.play(Paths.sound('confirmMenu'));
		}
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new OptionsMenu());
			FlxG.sound.play(Paths.sound('confirmMenu'));
		}
		if (controls.BACK)
		{
			FlxG.switchState(new TitleState());
			FlxG.sound.play(Paths.sound('cancelMenu'));
		}
		super.update(elapsed);
	}
}
