package widgets.ControlPanel.ListControlPanel
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.core.ClassFactory;
	import mx.managers.IFocusManagerComponent;
	
	import spark.components.DataGroup;
	
	[Event(name="menuItemClick", type="flash.events.Event")]
	[Event(name="menuItemMouseOver", type="flash.events.Event")]
	[Event(name="menuItemMouseOut", type="flash.events.Event")]
	
	public class MenuItemDataGroup extends DataGroup
	{
		public function MenuItemDataGroup()
		{
			super();
			
			this.itemRendererFunction = rendererFunction;
			
			addEventListener(KeyboardEvent.KEY_UP, keyboardKeyUpHandler);
		}
		
		private function rendererFunction(item:Object):ClassFactory
		{
			if ( item.isGroup )
			{
				return new ClassFactory( GroupMenuItemDataGroupRenderer );
			}
			else
			{
				return new ClassFactory( UngroupMenuItemDataGroupRenderer );
			}
		}
		
		private function keyboardKeyUpHandler(event:KeyboardEvent):void
		{
			var comp:IFocusManagerComponent;
			
			if (event.keyCode == Keyboard.LEFT)
			{
				comp = focusManager.getNextFocusManagerComponent(true);
			}
			else if (event.keyCode == Keyboard.RIGHT)
			{
				comp = focusManager.getNextFocusManagerComponent();
			}
			
			if (comp && (comp is UngroupMenuItemDataGroupRenderer || comp is GroupMenuItemDataGroupRenderer))
			{
				comp.setFocus();
			}
		}
	}
}