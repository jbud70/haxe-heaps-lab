import h2d.Anim;

class Main extends hxd.App {
    var bmp : h2d.Bitmap;
    var spinSpeed : Float = 0.01;

    override function init() {
        // allocate a Texture with red color and creates a 100x100 Tile from it
        var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
        // create a Bitmap object, which will display the tile
        // and will be added to our 2D scene (s2d)
        bmp = new h2d.Bitmap(tile, s2d);

        var spinInteraction = new h2d.Interactive(100, 100, bmp);

        spinInteraction.visible = true;

        spinInteraction.onOver = function (event : hxd.Event) {
            spinSpeed = 0.0;
        }

        spinInteraction.onOut = function (event : hxd.Event) {
            spinSpeed = 0.01;
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
        var anim = new h2d.Anim([t1,t2,t3],s2d);
        anim.x = 100;
        anim.y = 100;
        anim.speed = 10;

        anim.pause = true;
        
        var interaction = new h2d.Interactive(anim.frames[0].width, anim.frames[0].height, anim);

        interaction.onOver = function(event : hxd.Event) {
            toggleAnimPlay(anim);
        }

        interaction.onOut = function(event : hxd.Event) {
            toggleAnimPlay(anim);
        }

        /* anim.loop = true;

        var playCount = 0;

        anim.onAnimEnd = function () {
            playCount += 1;

            trace(playCount);

            if (playCount >= 10) {
                // anim.play([t1,t2,t3], 0);
                toggleAnimPlay(anim);
            }
        } */

    }

    function toggleAnimPlay(anim: Anim): Void {
        if (anim.pause == true) {
            anim.play(anim.frames, 0);
        }
        else {
            anim.pause = true;
        }
    }

    // on each frame
    override function update(dt:Float) {
        // increment the display bitmap rotation by 0.1 radians
        bmp.rotation += spinSpeed;
    }

    static function main() {
        new Main();
    }
}