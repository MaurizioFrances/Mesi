package
{
	import flash.events.AsyncErrorEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class DataHandler
	{
		public function DataHandler()
		{
		}
		
		protected function getData(requestVars:URLVariables, method:String):void
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest("http://www.memomedia.co.nz/dbMesi.php");
			
			request.method = method;	
			request.data = requestVars;
			
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, parseSpecificPersonJSON);
			
			trace("Loading JSON file...");
		}
		
		protected function parseSpecificPersonJSON(e:Event):void {
			
			
			if(e.target.data){
				
				try
				{
					var parsedJSONData:Object = JSON.parse(e.target.data);
				} 
				catch(error:Error) 
				{
					trace("Could not parse JSON!");
					trace("Recieved:" + e.target.data);
				}
				
				
				for each(var obj:Object in parsedJSONData){
					
					if(obj.name)
						trace("Name: " + obj.name);
					if(obj.userID)
						trace("Id: " + obj.userID);
					if(obj.coins)
						trace("Coins: " + obj.coin);
					if(obj.points)
						trace("Points: " + obj.points);
						GlobalData.instance.setPoints(obj.points);
					if(obj.category)
						GlobalData.instance.setPost(obj.location,obj.category,obj.time,obj.paused);
					if(obj.facebookID)
						trace("FB: " + obj.facebookID);
					
					
					//lblPoints.text = String(GlobalData.instance.points);
				}								
			}
		}
		
		public function getPoints():void
		{			
			var requestVars:URLVariables = new URLVariables();
			requestVars.action = "getPoints";
			requestVars.facebookID = GlobalData.instance.facebookID;
			getData(requestVars, URLRequestMethod.GET);
		}
		
		public function checkPosted():void
		{
			var requestVars:URLVariables = new URLVariables();
			requestVars.action = "checkPosted";
			requestVars.fromID = GlobalData.instance.facebookID;
			getData(requestVars, URLRequestMethod.GET);
		}
	}
}