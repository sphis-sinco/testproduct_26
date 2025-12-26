package backend.objects;

class Heart extends Sprite
{
	override public function new(?scaleOffset:Null<Float> = 0.0, x:Float = 0, y:Float = 0)
	{
		super('assets/heart.png', scaleOffset, x, y);
	}
}
