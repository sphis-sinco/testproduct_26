package scenes.v2;

import backend.Scene;

class V2Intro extends Scene
{
    public var impatientRoute:Bool = false;

	override public function new(impatientRoute:Bool = false)
	{
		super((impatientRoute) ? 'M2intro_ir' : 'M2intro_nr');

        this.impatientRoute = impatientRoute;
	}
}
