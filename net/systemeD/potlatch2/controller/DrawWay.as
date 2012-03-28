package net.systemeD.potlatch2.controller {
	import flash.events.*;
	import flash.geom.*;
	import flash.display.DisplayObject;
	import flash.ui.Keyboard;
	import net.systemeD.potlatch2.EditController;
	import net.systemeD.halcyon.connection.*;
	import net.systemeD.halcyon.connection.actions.*;
	import net.systemeD.halcyon.Elastic;
	import net.systemeD.halcyon.MapPaint;

	public class DrawWay extends SelectedWay {
		private var elastic:Elastic;
		private var editEnd:Boolean;            // if true, we're drawing from node[n-1], else "backwards" from node[0] 
		private var leaveNodeSelected:Boolean;
		private var hoverEntity:Entity;			// keep track of the currently rolled-over object, because
												// Flash can fire a mouseDown from the map even if you
												// haven't rolled out of the way
		

		public function DrawWay(way:Way, editEnd:Boolean, leaveNodeSelected:Boolean) {
			super(way);
			this.editEnd = editEnd;
			this.leaveNodeSelected = leaveNodeSelected;
		}		
		
		override public function processMouseEvent(event:MouseEvent, entity:Entity):ControllerState {
			return new NoSelection();	// in case user has clicked Undo
		}
		
		
		protected function resetElastic(node:Node):void {
		}

		/* Fix up the elastic after a WayNode event - e.g. triggered by undo */
		private function fixElastic(event:Event):void {
		}

		override public function processKeyboardEvent(event:KeyboardEvent):ControllerState {
			return new NoSelection();	// in case user has clicked Undo
		}

		public function replaceNode():ControllerState {
			return new NoSelection();	// in case user has clicked Undo
		}
		
		protected function keyExitDrawing():ControllerState {
			return new NoSelection();	// in case user has clicked Undo
		}
		
		protected function stopDrawing():ControllerState {
			return new NoSelection();	// in case user has clicked Undo
		}
		
		protected function appendNode(node:Node, performAction:Function):void {
		}
		
		protected function backspaceNode(performAction:Function):ControllerState {
			return new NoSelection();	// in case user has clicked Undo
		}
		
		protected function followWay():void {
		}
		
		override public function enterState():void {
		}

		override public function exitState(newState:ControllerState):void {
		}

		override public function toString():String {
			return "DrawWay";
		}
	}
}
