package net.systemeD.potlatch2.utils {

    import net.systemeD.halcyon.Map;
    import net.systemeD.halcyon.MapPaint;
    import net.systemeD.halcyon.connection.Marker;
    import net.systemeD.potlatch2.BugConnection;
    import flash.net.*;
    import flash.events.*;
    import flash.system.Security;

    public class BugLoader {

        private var map:Map;
        private var bugBaseURL:String;
        private var bugApiKey:String;
        private var bugDetailsURL:String;
        private var _layer:MapPaint;
        private var name:String;
        private static const STYLESHEET:String="stylesheets/bugs.css";
        private var connection:BugConnection;


        public function BugLoader(map:Map, url:String, bugApiKey:String, name:String, details:String = ''):void {
        }

        public function load():void {
        }
    }
}