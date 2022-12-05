package conquest.states;

import flixel.util.FlxSpriteUtil;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

using flixel.util.FlxSpriteUtil;

/** 
 * PlayState.hx is where Advent will start to access your game,
 * if you would like to add a menu to your game contact George!
**/
class PlayState extends FlxState {
	// Initialize Variables Here
	var player:Player;
	var jumpsList:Array<Int>;
	final START_POINTS = [
		// LEFT
		FlxPoint.get(0, 0.5),
		// RIGHT
		FlxPoint.get(1, 0.5),
		// UP
		FlxPoint.get(0.5, 0),
		// DOWN
		FlxPoint.get(0.5, 1)
	];

	// This is the Start function
	override function create() {
		super.create();

		var direction: Dir = FlxG.random.int(0, START_POINTS.length);
		var playerPos = START_POINTS[direction];
		player = new Player(direction);
		add(player);

		player.setPosition(playerPos.x * (Global.width - player.width), playerPos.y * (Global.height - player.height));
	}

	/** This is where your game updates each frame */
	override function update(elapsed:Float) {
		super.update(elapsed);
	}
}

class Player extends FlxSprite {
	var state:Float->Void;
	var arrow:FlxSprite;

	var dir:Dir;
	
	public function new(direction: Dir) {
		super();
		dir = direction;
		
		loadGraphic('assets/images/smile.png');

		arrow = new FlxSprite('assets/images/arrow.png');
		FlxG.state.add(arrow);
		state = waitingState;
	}

	override function setPosition(x:Float = 0.0, y:Float = 0.0) {
		super.setPosition(x, y);
		var md = getMidpoint();
		arrow.setPosition(md.x, md.y);
	}

	override function update(elapsed:Float) {
		state(elapsed);
		this.bound(0, Global.width, 0, Global.height);
		
		super.update(elapsed);
	}
	
	function waitingState(dt:Float) {
		
	}
}

enum abstract Dir(Int) from Int to Int {
	var LEFT = 0;
	var RIGHT = 1;
	var UP = 2;
	var DOWN = 3;
}