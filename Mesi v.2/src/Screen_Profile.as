package
{
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import starling.events.Event;
	
	import starling.display.DisplayObject;
	import starling.display.Quad;
	
	//Imports for Gesture handling 
	//Link to src for acheGesture
	import acheGesture.GestureManager;
	import acheGesture.gestures.SwipeGestureRecognizer;
	import acheGesture.data.*;
	import acheGesture.events.AcheGestureEvent;
	
	//Needed for FB
	import starling.core.Starling;
	import com.facebook.graph.FacebookMobile;
	import flash.media.StageWebView;
	import flash.geom.Rectangle;
	
	public class Screen_Profile extends Screen
	{
		public var pointHandler:DataHandler = new DataHandler();
		public var postedHandler:DataHandler = new DataHandler();
		
		public function Screen_Profile()
		{
			postedHandler.checkPosted();
			pointHandler.getPoints();
		}
		
		
		
		override protected function draw():void
		{
			trace(GlobalData.instance.posted);
			trace(GlobalData.instance.points);
		
		}
		
		override protected function initialize():void
		{
			//Creates a swipeGesture and adds it to the stage.
			//		var g1:Gesture = new SwipeGesture(onSwipeRecognized);
			//		    GestureManager.add(stage, new GestureVars().onSwipe(g1).vars);
		}
		
		
	}
}