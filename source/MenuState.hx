package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.nape.FlxNapeSpace;
import flixel.addons.nape.FlxNapeSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import nape.phys.Compound;

class MenuState extends FlxState
{
	
	var ball:FlxNapeSprite;
	var compound:Compound;
	
	override public function create():Void
	{
		super.create();
		
		FlxNapeSpace.init();
		FlxNapeSpace.createWalls();
		FlxNapeSpace.drawDebug = true;
		FlxNapeSpace.space.gravity.setxy(0, 1000);
		
		ball = new FlxNapeSprite(100, 100, null, false);
		ball.createCircularBody();
		compound = new Compound();
		compound.space = FlxNapeSpace.space;
		
		
		//adding the ball
		compound.bodies.add(ball.body);
		
		add(ball);
	}

	override public function update(elapsed:Float):Void
	{
		
		if (FlxG.mouse.justReleased){
			ball.kill();
		}
		
		super.update(elapsed);
	}
}
