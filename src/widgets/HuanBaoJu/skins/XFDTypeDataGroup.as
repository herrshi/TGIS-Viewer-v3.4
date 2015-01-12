package widgets.HuanBaoJu.skins
{
	import mx.core.ClassFactory;
	
	import spark.components.DataGroup;
	
	[Event(name="itemClick", type="flash.events.Event")]
	
	public class XFDTypeDataGroup extends DataGroup
	{
		public function XFDTypeDataGroup()
		{
			super();
			
			this.itemRenderer = new ClassFactory( XFDTypeDataGroupRenderer );
		}
	}
}