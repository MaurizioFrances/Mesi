package
{
	import acheGesture.GestureManager;
	import acheGesture.data.*;
	import acheGesture.events.AcheGestureEvent;
	import acheGesture.gestures.SwipeGestureRecognizer;
	
	import com.facebook.graph.FacebookMobile;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	
	public class Screen_Login extends Screen
	{
		protected var loginButton:Button;
		protected var pageFrom:int;
		
		public var facebookID:String;
		public var permissions:Array = ["user_birthday", "read_stream", "publish_stream"];
		
		public function Screen_Login()
		{
			FacebookMobile.init("200854816712993",loginHandler);
		}
		
		override protected function draw():void
		{
			loginButton.width = 150;
			loginButton.height = 50;
			
			//centre the button
			loginButton.x = actualWidth/2 - loginButton.width/2;
			loginButton.y = actualHeight/2 - loginButton.height/2;			
		}
		
		override protected function initialize():void
		{
			//Creates a swipeGesture and adds it to the stage.
			//		var g1:Gesture = new SwipeGesture(onSwipeRecognized);
			//		    GestureManager.add(stage, new GestureVars().onSwipe(g1).vars);
			
			loginButton = new Button();
			loginButton.label = "Login";
			loginButton.addEventListener(starling.events.Event.TRIGGERED, FBlogin);
			addChild(loginButton);
			
		}
		
		protected function loginHandler(success:Object,fail:Object):void
		{
			
			//trace(success);
			if(success){
				
				
				facebookID =success.user.id;
				
				trace("User ID:  " + success.user.id + "  Name:  " + success.user.first_name + success.user.last_name);
				GlobalData.instance.setFacebook(success.user.id,success.user.first_name,success.user.last_name);
				dispatchEventWith("toScreenProfile");
				
			} 
		}
		
		
		//BUTTONS
		private function FBlogin(e:Event):void
		{
			var facebookWebView:StageWebView = new StageWebView();
			
			facebookWebView.stage = Starling.current.nativeStage;
			facebookWebView.viewPort = new Rectangle(0, 0, Starling.current.nativeStage.stageWidth, Starling.current.nativeStage.stageHeight);//for cancel fblogin button
			FacebookMobile.login(loginHandler, Starling.current.nativeStage, permissions, facebookWebView);		}
		
	}
}