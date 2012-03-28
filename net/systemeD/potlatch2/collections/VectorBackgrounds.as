package net.systemeD.potlatch2.collections {

	import flash.events.*
	import flash.net.*
	import flash.system.Security;
	import net.systemeD.halcyon.Map;
	import net.systemeD.halcyon.MapPaint;
	import net.systemeD.halcyon.connection.Connection;
	import net.systemeD.halcyon.DebugURLRequest;
	import net.systemeD.potlatch2.utils.*;
		
	public class VectorBackgrounds extends EventDispatcher {

		private static const GLOBAL_INSTANCE:VectorBackgrounds = new VectorBackgrounds();
		public static function instance():VectorBackgrounds { return GLOBAL_INSTANCE; }

		private var _map:Map;


		public function init(map:Map):void {
			_map = map;
			var request:DebugURLRequest = new DebugURLRequest("vectors.xml");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onConfigLoad);
			loader.load(request.request);
		}

		public function onConfigLoad(e:Event):void {
			var xml:XML = XML(e.target.data);

			// reconstitute results as Array, as we can't run .forEach over an XMLList
			var sets:Array = [];
			for each (var set:XML in xml.set) { sets.push(set); }
			
			// use .forEach to avoid closure problem (http://stackoverflow.com/questions/422784/how-to-fix-closure-problem-in-actionscript-3-as3#3971784)
			sets.forEach(function(set:XML, index:int, array:Array):void {

				if (!(set.policyfile == undefined)) {
					Security.loadPolicyFile(String(set.policyfile));
				}

                // Check for any bounds for the vector layer. Obviously won't kick in during subsequent panning
                var validBbox:Boolean = false;
                if (set.@minlon && String(set.@minlon) != '') {
                    if (((_map.edge_l>set.@minlon && _map.edge_l<set.@maxlon) ||
                         (_map.edge_r>set.@minlon && _map.edge_r<set.@maxlon) ||
                         (_map.edge_l<set.@minlon && _map.edge_r>set.@maxlon)) &&
                        ((_map.edge_b>set.@minlat && _map.edge_b<set.@maxlat) ||
                         (_map.edge_t>set.@minlat && _map.edge_t<set.@maxlat) ||
                         (_map.edge_b<set.@minlat && _map.edge_t>set.@maxlat))) {
                        validBbox = true;
                    } else {
                        validBbox = false; // out of bounds
                    }
                } else {
                    validBbox = true; // global set
                }

			});
		}
	}
}
