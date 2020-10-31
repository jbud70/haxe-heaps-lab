import h2d.Bitmap;
import h2d.Anim;

class Main extends hxd.App {
	var bmp:h2d.Bitmap;
	var spinSpeed:Float = 1;

	override function init() {
		hxd.Res.initLocal();

/* 		// allocate a Texture with red color and creates a 100x100 Tile from it
		var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
		// create a Bitmap object, which will display the tile
		// and will be added to our 2D scene (s2d)
		bmp = new h2d.Bitmap(tile, s2d);

		var spinInteraction = new h2d.Interactive(100, 100, bmp);

		spinInteraction.visible = true;

		spinInteraction.onOver = function(event:hxd.Event) {
			spinSpeed = 0.0;
		}

		spinInteraction.onOut = function(event:hxd.Event) {
			spinSpeed = 1.0;
		}

		// modify the display position of the Bitmap sprite
		bmp.x = s2d.width * 0.5;
		bmp.y = s2d.height * 0.5;

		// Add animation
		// creates three tiles with different color
		var t1 = h2d.Tile.fromColor(0xFF0000, 30, 30);
		var t2 = h2d.Tile.fromColor(0x00FF00, 30, 30);
		var t3 = h2d.Tile.fromColor(0x0000FF, 30, 30);

		// creates an animation for these tiles
		var anim = new h2d.Anim([t1, t2, t3], s2d);
		anim.x = 100;
		anim.y = 100;
		anim.speed = 10;

		anim.pause = true;

		var interaction = new h2d.Interactive(anim.frames[0].width, anim.frames[0].height, anim);

		interaction.onOver = function(event:hxd.Event) {
			toggleAnimPlay(anim);
		}

		interaction.onOut = function(event:hxd.Event) {
			toggleAnimPlay(anim);
		} */

		var coinTile = hxd.Res.Coin.toTile();
		var coinGrid = coinTile.gridFlatten(32);
		trace(coinGrid);
		trace("Hello");

		var coinArray:Array<Anim> = [];

		for (i in 0...(Math.floor(s2d.width / 32))) {
			for (j in 0...(Math.floor(s2d.height / 32))) {
				var coinAnim = new Anim(coinGrid, 10, s2d);
				coinAnim.currentFrame = Math.floor(10 % (i + j));  		
				coinAnim.speed = 20;
				coinAnim.x = 0 + 32 * i;
				coinAnim.y = 0 + 32 * j;
				coinAnim.alpha = 0.5;
				coinArray.push(coinAnim);
			}

		}


/* 		var coinStatic = new h2d.Bitmap(coinGrid[0], s2d);
		
		coinStatic.tile.dx = coinStatic.x / 2;
		coinStatic.tile.dy = coinStatic.y / 2;
		coinStatic.x = 20;
		coinStatic.y = 20;
		
		coinStatic.rotate(Math.PI / 180 * 45); */
		/* anim.loop = true;

			var playCount = 0;

			anim.onAnimEnd = function () {
				playCount += 1;

				trace(playCount);

				if (playCount >= 10) {
					// anim.play([t1,t2,t3], 0);
					toggleAnimPlay(anim);
				}
		}*/
	}

	function toggleAnimPlay(anim:Anim):Void {
		if (anim.pause == true) {
			anim.play(anim.frames, 0);
		} else {
			anim.pause = true;
		}
	}

	// on each frame
	override function update(dt:Float) {
		// increment the display bitmap rotation by 0.1 radians
		// bmp.rotation += spinSpeed * dt;
		// bmp.x += 10 * dt;
	}

	static function main() {
		new Main();
	}
}
