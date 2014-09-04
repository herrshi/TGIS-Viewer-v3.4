package widgets.Print
{

import cn.seisys.TGISViewer.BaseWidget;

import mx.core.IVisualElement;

public interface IPrintWidgetComponent extends IVisualElement
{
    function get configXML():XML;
    function set configXML(value:XML):void;

    function get hostBaseWidget():BaseWidget;
    function set hostBaseWidget(value:BaseWidget):void;
}
}
