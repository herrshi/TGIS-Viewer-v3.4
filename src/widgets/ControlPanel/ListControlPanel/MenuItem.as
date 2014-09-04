package widgets.ControlPanel.ListControlPanel
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	
	public class MenuItem extends EventDispatcher
	{
		public var id:Number; // id of the associated widget
		public var isGroup:Boolean;
		public var label:String;
		public var open:Boolean; // indicates whether the associated widget is open or closed
		public var groupMenuItems:Array;
	}
}