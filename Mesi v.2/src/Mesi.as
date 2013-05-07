package
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import starling.core.Starling;	
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.utils.RectangleUtil;
	import starling.display.Stage;
	import starling.utils.ScaleMode;
	
	
	[SWF(frameRate=60)]
	
	public class Mesi extends Sprite
	{
		public function Mesi()
		{
			
			
			//multitouch capabilities
			Starling.multitouchEnabled = true;
			
			
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle(0, 0, screenWidth, screenHeight);			
			
			var st:Starling = new Starling(Main, this.stage, viewPort);
			st.stage.stageWidth  = 320;
			st.stage.stageHeight = 480;
			st.antiAliasing = 16;
			//simulate multitouch on desktops
			st.simulateMultitouch = true;
			
			//var st:Starling = new Starling(Main, this.stage, new Rectangle(0, 0, 640, 960));
			st.showStats = true;
			st.start();
		}
	}
}