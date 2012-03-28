package net.systemeD.potlatch2 {

	import flash.display.*;
	import net.systemeD.halcyon.Map;
	import net.systemeD.halcyon.MapEvent;
	import com.yahoo.maps.api.YahooMap;
	import com.yahoo.maps.api.YahooMapEvent;
	import com.yahoo.maps.api.core.location.LatLon;
	
    public class Yahoo extends YahooMap {

		private var map:Map;
		private static const token:String="f0a.sejV34HnhgIbNSmVHmndXFpijgGeun0fSIMG9428hW_ifF3pYKwbV6r9iaXojl1lU_dakekR";
		private static const MAXZOOM:int=17;

		private static const UNINITIALISED:uint=0;
		private static const INITIALISING:uint=1;
		private static const HIDDEN:uint=2;
		private static const SHOWING:uint=3;
		private var currentState:uint=UNINITIALISED;

		private var _lat:Number;
		private var _lon:Number;
		private var _scale:Number;
		private var offset_lat:Number=0;
		private var offset_lon:Number=0;

		public function Yahoo(map:Map) {
			super();
		}
		
		public function show():void {
		}

		public function hide():void {
		}

		private function activateListeners():void {
		}
		
		private function deactivateListeners():void {
		}
		
		private function initHandler(event:YahooMapEvent):void {
		}

		private function moveHandler(event:MapEvent):void {
		}

		private function moveto(lat:Number,lon:Number,scale:uint):void {
		}
		
		private function resizeHandler(event:MapEvent):void {
		}
		
		private function nudgeHandler(event:MapEvent):void {
		}
	}
}
