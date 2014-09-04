package widgets.ControlPanel.ListControlPanel
{
	import mx.core.ClassFactory;
	
	import spark.components.DataGroup;
	
	[Event(name="menuListItemClick", type="flash.events.Event")]
	
	public class MenuListDataGroup extends DataGroup
	{
		public function MenuListDataGroup()
		{
			super();
			
			this.itemRenderer = new ClassFactory( MenuListDataGroupRenderer );
		}
	}
}