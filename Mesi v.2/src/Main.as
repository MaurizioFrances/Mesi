package
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManagerVertical;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class Main extends Sprite
	{
		private static const SCREEN_1:String = "screen_1";
		private static const SCREEN_2:String = "screen_2";
		private static const SCREEN_3:String = "screen_3";
		private static const SCREEN_CHALLENGES:String = "screen_challenges";
		private static const SCREEN_PROFILE:String = "screen_profile";
		private static const SCREEN_CREATE:String = "screen_create";
		private static const SCREEN_LOGIN:String = "screen_login";
		public static var bPage:int;
		
		//[Embed(source = "../assets/images/background.gif")]
		//public static const bg:Class;
		
		
		
		
		
		//private var page:int;
		
		private var nav:ScreenNavigator;
		
		
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		//	this.addEventListener(Event.ADDED_TO_STAGE, drawBackground);
		}
		
		protected var theme:MetalWorksMobileTheme
		//protected var button:Button;
		
		protected function addedToStageHandler( event:Event ):void
		{
			this.theme = new MetalWorksMobileTheme(this.stage);
			
			nav = new ScreenNavigator();
			this.addChild(nav);
			
		//	var screen_1:ScreenNavigatorItem = new ScreenNavigatorItem(Screen_1, {toScreen2:SCREEN_2, toScreenChallenges:SCREEN_CHALLENGES, toScreenProfile:SCREEN_PROFILE, toScreenCreate:SCREEN_CREATE}, null);
		//	nav.addScreen(SCREEN_1,screen_1);

			var screen_Login:ScreenNavigatorItem = new ScreenNavigatorItem(Screen_Login, {toScreenProfile:SCREEN_PROFILE}, null);
			nav.addScreen(SCREEN_LOGIN,screen_Login);
			
			var screen_Profile:ScreenNavigatorItem = new ScreenNavigatorItem(Screen_Profile, null, null);
			nav.addScreen(SCREEN_PROFILE,screen_Profile);
			
			//initialises first screen
			nav.showScreen(SCREEN_LOGIN);
			
			var screenTransitionVert:ScreenSlidingStackTransitionManagerVertical = new ScreenSlidingStackTransitionManagerVertical(nav);
			//var screenTransition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(nav);
			
			//Makes Screen_1 an 'old' screen so the stack will pop to it
			//Stolen from
			//http://forum.starling-framework.org/topic/transitionmanager-question
			//screenTransitionVert.addClassToStack(Screen_1, SCREEN_1);
		}
		
	/*	private function drawBackground(e:Event):void
		{
			
			
			var bgBitmap:Bitmap = new bg();
			var backgroundTexture:starling.textures.Texture = starling.textures.Texture.fromBitmap(bgBitmap);
			
			var backgroundImage:Image = new Image(backgroundTexture);
			bgBitmap.bitmapData.dispose();
			
			
			
			
			backgroundImage.width = stage.width;
			backgroundImage.height = stage.height-10;
			trace("Width:  " + stage.width + "    Height:  " + stage.height);
			
			backgroundImage.x = 0;
			backgroundImage.y = -10;
			//stage.addChild(backgroundImage);
			
			stage.addChildAt(backgroundImage, 1);
			//this.addChild(backgroundImage);
		} */
		
		private function backPage(e:Event, bp:int):void
		{
			bPage = bp;
			if(bPage==1)
			{
				nav.showScreen(SCREEN_1);
			}
			else if(bPage==2)
			{
				nav.showScreen(SCREEN_2);
			}
			else if(bPage==3)
			{
				nav.showScreen(SCREEN_3);
			}
		}
		
	}	
}