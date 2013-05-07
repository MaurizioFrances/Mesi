package
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class GlobalData extends EventDispatcher
	{
		private static var _instance:GlobalData;
		
		public var facebookID:String;
		public var category:String;
		public var firstName:String;
		public var lastName:String;
		public var fullName:String;
		public var points:int;
		
		public var posted:Boolean = false;
		public var postCategory:String;
		public var postLocation:String;
		public var postPaused:int;
		public var postTime:String;
		
		public var userCategoriesArray:Array = new Array();
		
		

		public static function get instance():GlobalData
		{
			if(!_instance)
				{_instance = new GlobalData();}
			
			return _instance;
		}
		
		
		public function setFacebook(id:String,first:String,last:String):void
		{
			facebookID = id;
			firstName = first;
			lastName = last;
			fullName = first + " " + last; 
		}
		
		public function setPoints(pnt:int):void
		{
			points = pnt;
		}
		
		public function setPost(location:String,category:String,time:String,paused:String):void
		{
			postLocation = location;
			postCategory = category;
			postTime = time;
			
			posted = true;
			if(paused=="1")
			{postPaused=1;}
		}
		
		public function setPostLocation(location:String,category:String,time:String):void
		{
			postLocation = location;
			postCategory = category;
			postTime = time;
			
			posted = true;
		}
		
		public function updatePost(location:String):void
		{
			postLocation = location;
		}
		
		public function pausePost(pause:int):void
		{
			postPaused = pause;
		}
		
		public function cancelPost():void
		{
			postPaused = 0;
			posted = false;
		}
		
		public function clearUserCategories():void
		{
			userCategoriesArray = new Array;
		}
		
		public function addUserCategory(cat:String):void
		{
			userCategoriesArray.push(cat);
		}
		
		public function gotAllCategories():void
		{
			this.dispatchEvent(new Event("gotAllCategories"));
		}
		
		public function GlobalData()
		{
		}
	}
}