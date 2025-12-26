package backend.objects;

class KojnMouth extends Sprite
{
	public var state:String = 'frown';

	override public function new(?scaleOffset:Null<Float> = 0.0, x:Float = 0, y:Float = 0)
	{
		super(null, scaleOffset, x, y);

        setState(state);
	}

	public function setState(state:String = 'frown')
	{
		this.state = state;

		loadGraphic('assets/kojn/mouth/$state.png');
	}
}
