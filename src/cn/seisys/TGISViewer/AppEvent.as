///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2010-2011 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package cn.seisys.TGISViewer
{

import flash.events.Event;

import cn.seisys.TGISViewer.managers.EventBus;

/**
 * AppEvent is used within the application to send messages among components
 * through the EventBus. All event driven messaging in the Flex Viewer is
 * using the AppEvent.
 *
 * <p>The typical way of sending a message via the AppEvent is, for example:</p>
 *
 * <listing>
 *   AppEvent.dispatch(AppEvent.DATA_OPT_LAYERS, null, getOplayers));
 * </listing>
 *
 * <p>The typical way of receiving a message via the AppEvent is, for example:</p>
 * <listing>
 *   AppEvent.addListener(AppEvent.DATA_PUBLISH, sharedDataUpdated);
 * </listing>
 *
 * @see cn.seisys.TGISViewer.managers.EventBus
 */
public class AppEvent extends Event
{
    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    /**
     * The error event type. This event type is used to send a user friendly
     * error message via the event bus. A error window will display the error
     * message.
     *
     * <p>When sending the error message, the data sent with the AppEvent is the
     * error string. For example: </p>
     *
     * <listing>
     * AppEvent.dispatch(AppEvent.APP_ERROR, "An Error Message"));
     * </listing>
     *
     * @see cn.seisys.TGISViewer.components.ErrorWindow
     */
    public static const APP_ERROR:String = "appError";

    /**
     * This event type indicates that the Flex Viewer application has completed loading the
     * configuration file. The ConfigManager sends this event so that other components that
     * are interested in obtaining configuration data can listen to this event.
     *
     * @see ConfigManager
     */
    public static const CONFIG_LOADED:String = "configLoaded";

    /**
     * This event type indicates that the map is loaded. The MapManager sends this event so
     * that other components such as the Controller can start working with the map.
     *
     * @see MapManager
     * @see Controller
     */
    public static const MAP_LOADED:String = "mapLoaded";

    public static const MAP_RESIZE:String = "mapResize";

    public static const MAP_LAYER_VISIBLE:String = "mapLayerVisibleChange";

    /**
     * This event type indicates a dynamic layer is loaded.
     */
    public static const LAYER_LOADED:String = "layerLoaded";

    //public static const LAYER_VISIBLE_CHANGED:String   = "layerVisibilityChanged";
    /**
     * This event type is used by the Controller to indicate the base map has changed.
     *
     * @see Controller
     */
    public static const BASEMAP_SWITCH:String = "basemapSwitch";


    /**
     * This event type is used by either Flex Viewer components or a widget to
     * request set the map navigation method. The map navigation method could be
     * pan, zoomin, zoomout, etc.
     *
     * <p>The navigation methods supported are:</p>
     * <listing>
     * pan          (Navigation.PAN)
     * zoomin       (Navigation.ZOOM_IN)
     * zoomout      (Navigation.ZOOM_OUT)
     * zoomfull     (ViewerContainer.NAVIGATION_ZOOM_FULL)
     * zoomprevious (ViewerContainer.NAVIGATION_ZOOM_PREVIOUS)
     * zoomnext     (ViewerContainer.NAVIGATION_ZOOM_NEXT)
     * </listing>
     *
     * <p>The navigation request can be sent as such:</p>
     * <listing>
     *  var data:Object =
     *     {
     *       tool: Navigation.PAN,
     *       status: status
     *      }
     *   AppEvent.dispatch(AppEvent.SET_MAP_NAVIGATION, false, false, data));
     * </listing>
     *
     */
    public static const SET_MAP_NAVIGATION:String = "setMapNavigation";

    /**
     * This event type is used to set the status text shown at the controller bar. to AppEvent
     * to set the status string, for example:
     *
     * <listing>
     *  dispatchEvent(new AppEvent(AppEvent.SET_STATUS, false, false, status));
     * </listing>
     */
    public static const SET_STATUS:String = "setStatus";

    /**
     * Used to show the info windows on the map through the AppEvent via EventBus.
     *
     * <listing>
     *  AppEvent.dispatch(AppEvent.SHOW_INFOWINDOW, infoData);
     * </listing>
     *
     * The infoData is a dynamic object structure as, for example:
     * <listing>
     *   var infoData:Object =
     *       {
     *          icon: icon,              //a Image object
     *          title: "a title string",
     *          content: "a string",
     *          link: "http://a.url.com",
     *          point: point,            //a Point object
     *          geometry: geom           //a Geometry object
     *       };
     * </listing>
     */
    public static const SHOW_INFOWINDOW:String = "widgetShowInfo";

    /**
     * Used to set map's interactive mode, such as Draw point, line, etc. To
     * use AppEvent via EventBus:
     *
     * <listing>
     * AppEvent.dispatch(AppEvent.SET_MAP_ACTION, data));
     * </listing>
     *
     * Where data is a dynamic data structure:
     *
     * <listing>
     * var data:Object =
     *   {
     *       tool: action,       //an action string token
     *       status: "status string",
     *       handler: callback   //a callback Function
     *   }
     * </listing>
     * Please refer to the Developer's Guide for details.
     */
    public static const SET_MAP_ACTION:String = "setMapAction";

    /**
     * For widget chain and data manager to manage the session generated data.
     */
    public static const DATA_PUBLISH:String = "dataPublishing";

    /**
     * For widget chain. TBD
     */
    public static const DATA_NEW_PUBLISHED:String = "dataPublished";

    /**
     * for widget chain. TBD
     */
    public static const DATA_FETCH_ALL:String = "dataFetchAll";

    public static const DATA_FETCH:String = "dataFetch";

    public static const DATA_SENT:String = "dataFetched";

    public static const DATA_OPT_LAYERS:String = "dataOperationalLayers";

    public static const DATA_CREATE_INFOWIDGET:String = "createInfoWidget";

    /**
     * for widget layout
     */
    public static const CHANGE_LAYOUT:String = "changeLayout";

    /**
     * This event type is used by the Controller to indicate a widget run request
     */
    public static const WIDGET_RUN:String = "widgetRunRequested";

    /**
     * used to send message to widget to change its state such as close, min and max
     * var data:Object {
     *    id: widgetId, //as Number
     *    state: stateString //as String
     * }
     * AppEvent.publish(AppEvent.WIDGET_CHANGE_STATE, data);
     */
    public static const WIDGET_CHANGE_STATE:String = "widgetChangeState";

    public static const WIDGET_STATE_CHANGED:String = "widgetStateChanged";

    /**
     * for widget layout
     */
    public static const WIDGET_FOCUS:String = "focusWidget";

    public static const WIDGET_CHAIN_NEXT:String = "widgetChainNextRequested";

    public static const WIDGET_CHAIN_START:String = "widgetChainStartRequested"

    public static const WIDGET_MGR_RESIZE:String = "widgetManagerResize";

    public static const WIDGET_ADD:String = "addWidget";

    public static const WIDGET_ADDED:String = "widgetAdded";
	
	public static const WIDGET_CREATED:String = "widgetCreated";

    public static const WIDGET_CLOSE:String = "closeWidget";

    public static const INFOWIDGET_REQUEST:String = "requestInfoWidget";

    public static const INFOWIDGET_READY:String = "infoWidgetReady";

    /**
     * Builder events.
     */
    public static const SET_TITLES:String = 'setTitles';

    public static const SET_LOGO:String = 'setLogo';

    public static const SET_TITLE_COLOR:String = 'setTitleColor';

    public static const SET_TEXT_COLOR:String = 'setTextColor';

    public static const SET_BACKGROUND_COLOR:String = 'setBackgroundColor';

    public static const SET_ROLLOVER_COLOR:String = 'setRolloverColor';

    public static const SET_SELECTION_COLOR:String = 'setSelectionColor';

    public static const SET_APPLICATION_BACKGROUND_COLOR:String = 'setApplicationBackgroundColor';

    public static const SET_ALPHA:String = 'setAlpha';

    public static const SET_FONT_NAME:String = 'setFontName';

    public static const SET_APP_TITLE_FONT_NAME:String = 'setAppTitleFontName';

    public static const SET_SUB_TITLE_FONT_NAME:String = 'setSubTitleFontName';

    public static const SET_PREDEFINED_STYLES:String = 'setPredefinedStyles';

    public static const TOC_HIDDEN:String = "tocHidden";

    public static const SUSPEND_TOC_HIDE_TIMER:String = "suspendTOCHideTimer";

    public static const LAUNCHING_TOC_LAYER_MENU:String = "launchingTocLayerMenu";
	
	
	/**
	 * Legend(Widget) Refresh
	 */
	public static const REFRESH_LEGEND:String = "refreshLegend";
	
	/**
	 * 自定义事件
	 * */
	
	/**
	 * 通过ExternalInterface.call调用jsp函数
	 * <listing>
	 * var data:Object = 
	 *   {
	 *     functionName: 要执行的jsp函数名
	 *     params: Array, 参数数组
	 *   }
	 * </listing>
	 * */
	public static const EXTERNALINTERFACE_CALL:String = "externalInterfaceCall";
	
	/**
	 * 提供在地图上增加图标的接口。显示样式由flash配置文件指定。
	 * 参数: json字符串
	 * */
	public static const ADD_POINTS:String = "addPoints";
	
	/**
	 * 提供在地图上增加图标的接口。显示样式由页面指定。
	 * */
	public static const ADD_POINTS_BY_PAGE:String = "addPointsByPage";
	
	/**
	 * 提供在地图上删除全部图标的接口。
	 * */
	public static const DELETE_ALL_POINTS:String = "deleteAllPoints";
	
	/**
	 * 提供在地图上删除指定图标的接口。
	 * 参数: json字符串
	 * */
	public static const DELETE_POINTS:String = "deletePoints";
	
	public static const ADD_POLYGONS:String = "addPolygon";
	public static const DELETE_POLYGONS:String = "deletePolygons";
	public static const DELETE_ALL_POLYGONS:String = "deleteAllPolygons";
	
	/**
	 * 提供在地图上增加文字的接口。
	 * 参数: json字符串
	 * */
	public static const ADD_TEXTS:String = "addTexts";
	
	public static const DELETE_ALL_TEXTS:String = "deleteAllTexts";
	
	public static const DELETE_TEXTS:String = "deleteTexts";
	
	/**
	 * 提供在地图上增加polyline的接口
	 * */
	public static const ADD_LINES:String = "addLines";
	
	public static const DELETE_ALL_LINES:String = "deleteAllLines";
	
	public static const DELETE_LINES:String = "deleteLines"
	
	/**
	 * 根据配置文件里的图层名控制图层
	 * <listing>
	 * var data:Object = 
	 *   {
	 *     serviceName: 配置文件里的operationallayers.layer.label
	 *     layerIds: 图层序号，多个用","分割
	 *     visible: true/false
	 *   }
	 * </listing>
	 * */
	
	public static const CHANGE_LAYER_VISIBILITY_BY_NAME:String = "changeLayerVisibilityByName";
	
	/**
	 * 设置地图中心点
	 * <listing>
	 * 	 x:Number
	 *   y:Number
	 * </listing>
	 * */
	public static const SET_MAP_CENTER:String = "setMapCenter";
	
	
	public static const SET_MAP_SCALE:String = "setMapScale";
	
	public static const SET_MAP_EXTENT:String = "setMapExtent";
	
	/**
	 * 隐藏地图弹出窗口
	 * */
	public static const HIDE_INFO_POPUP:String = "hideInfoPopUp";
	
	/**
	 * 显示行程时间，包括起点、终点、连线、连线中间显示的文字。
	 * 参数: json字符串
	 * */
	public static const ADD_TRAVEL_TIME:String = "addTravelTime";
	
	/**
	 * 隐藏行程时间相关内容。
	 * */
	public static const DELETE_TRAVEL_TIME:String = "deleteTravelTime";
	
	/**
	 * 缓冲查询
	 * <listing>
	 * var data:Object = 
	 *   {
	 *     type: 查询类型，警员/警情/...
	 *     id: 中心点编号（警情/警员编号）
	 *     point: 中心点坐标,
	 * 	   distance: 半径
	 *     token: 令牌，返回给调用者
	 *   }
	 * </listing>
	 * */
	public static const BUFFER_SEARCH:String = "bufferSearch";
	
	/**
	 * 清除缓冲查询的结果
	 * */
	public static const CLEAR_BUFFER_SEARCH:String = "clearBufferSearch";
	
	/**
	 * 获取设备坐标
	 * */
	public static const GET_DEVICE_COORDINATE:String = "getDeviceCoordinate";
	
	/**
	 * 在polyline上模拟匀速移动的点
	 * <listing>
	 * var data:Object =
	 *   {
	 *     id: 编号,
	 *     route: json string格式的polyline,
	 *     speed: 移动速度
	 *   }
	 * </listing>
	 * */
	public static const SIM_MOVE_POINT_START:String = "startSimMovePoint";
	
	/**
	 * 暂停模拟移动
	 * <listing>
	 * var id:String
	 * </listing>
	 * */
	public static const SIM_MOVE_POINT_PAUSE:String = "pauseSimMovePoint";
	
	/**
	 * 从暂停中恢复模拟移动
	 * <listing>
	 * var id:String
	 * </listing>
	 * */
	public static const SIM_MOVE_POINT_RESUME:String = "resumeSimMovePoint";
	
	/**
	 * 停止模拟移动
	 * <listing>
	 * var id:String
	 * </listing>
	 * */
	public static const SIM_MOVE_POINT_STOP:String = "stopSimMovePoint";
	
	/**
	 * 设置模拟移动速度
	 * <listing>
	 * var speed:Number
	 * </listing>
	 * */
	public static const SIM_MOVE_POINT_SET_SPEED:String = "setSimMovePointSpeed";
	
	/**
	 * 请求模拟移动点当前的位置
	 * <listing>
	 * var id:String
	 * </listing>
	 * */
	public static const GET_SIM_MOVE_POINT_CURRENT_POINT:String = "getSimMovePointCurrentPoint";
	
	/**
	 * 返回模拟移动点当前的位置
	 * <listing>
	 * var point:Graphic
	 * </listing>
	 * */
	public static const SET_SIM_MOVE_POINT_CURRENT_POINT:String = "setSimMovePointCurrentPoint";
	
	/**
	 * 增加单车轨迹。
	 * 参数：json字符串
	 * */
	public static const ADD_CAR_TRACK:String = "addCarTrack";
	
	/**
	 * 删除指定单车轨迹。
	 * 参数: json字符串
	 * */
	public static const DELETE_CAR_TRACK:String = "deleteCarTrack";
	
	/**
	 * 删除所有单车轨迹。
	 * 参数: 无
	 * */
	public static const DELETE_ALL_CAR_TRACK:String = "deleteAllCarTrack";
	
	/**
	 * 绿波带播放控制
	 * <listing>
	 * var data:Object =
	 *   {
	 *     id: 绿波带编号,
	 *     status: play/stop/pause,
	 *   }
	 * </listing>
	 * */
	public static const GWB_PLAY_CONTROL:String = "gwbPlayControl";
	
	/**
	 * 清除地图上当前选择内容
	 * */
	public static const CLEAR_SELECTION:String = "clearSelection";
	
	/**
	 * 做路口封锁时页面回传需要封锁的关联信号灯
	 * 参数：逗号分隔的信号机编号
	 * */
	public static const SET_RELATE_XHD:String = "setRelateXHD";
	
	/**
	 * 增加警员、警车等gps轨迹
	 * 参数：json字符串
	 * */
	public static const ADD_GPS_TRACK:String = "addGpsTrack";
	public static const DELETE_ALL_GPS_TRACK:String = "deleteAllGpsTrack";
	
	/**
	 * 绘制缓冲区
	 * <listing>
	 * var data:Object =
	 *   {
	 *     geometry: 点、线、面
	 *     distance: 缓冲半径
	 *   }
	 * </listing> 
	 * */
	public static const DRAW_BUFFER:String = "drawBuffer";
	
	/**
	 * 清除所有缓冲区
	 * */
	public static const DELETE_ALL_BUFFER:String = "deleteAllBuffer";
	
	/**
	 * 根据名称改变地图显示范围，名称对应的extent保存在配置文件中
	 * <listing>
	 * var name:String
	 * </listing>
	 * */
	public static const LOCATOR_MAP_BY_NAME:String = "locatorMapByName";
	
	/**
	 * 刷新地图
	 * */
	public static const REFRESH_MAP:String = "refreshMap";
	
	/**
	 * 页面输入查询条件对图层进行过滤
	 * <listing>
	 * var data:Object =
	 *   {
	 *     var serviceName:String，服务名，配置在config.xml中的layer.label。为空则设置所有dynamic/feature服务的definition。
	 *     var layerId:Number，图层序号。为空则设置服务下的所有layer。
	 *     var whereClause:String，查询条件。
	 *   }
	 * </listing>
	 * */
	public static const SET_LAYER_FILTER_DEFINITION:String = "setLayerFilterDifinition";
	
	/**
	 * 通知Overlay组件进入移动状态
	 * <listing>
	 * var data:Object = 
	 *   {
	 *     var type:String，组件的type。
	 *     var ids:[]，要移动的grahpic的id数组。为空则所有graphic都可以移动
	 *   }
	 * </listing>
	 * */
	public static const START_MOVE_OVERLAY:String = "startEditOverlay";
	
	/**
	 * 通知Overlay组件进入新增状态
	 * <listing>
	 * var type:String
	 * </listing>
	 * */
	public static const START_ADD_OVERLAY:String = "startAddOverlay";
	
	/**
	 * 通知Overlay组件结束编辑状态
	 * <listing>
	 * var type:String
	 * </listing>
	 * */
	public static const STOP_EDIT_OVERLAY:String = "stopEditOverlay";
	
	/**
	 * 通知Overlay组件结束新增状态
	 * <listing>
	 * var type:String
	 * </listing>
	 * */
	public static const STOP_ADD_OVERLAY:String = "stopAddOverlay";
	
	/**
	 * 通知页面删除点位
	 * <listing>
	 * var data:Object = 
	 *   {
	 *     var type:String，组件的type。
	 *     var ids:[]，要删除的grahpic的id数组。
	 *   }
	 * </listing>
	 * */
	public static const DELETE_POINTS_BY_MAP:String = "deletePointsByMap";
	
	/**
	 * 点击编辑工具栏的后退按钮触发的事件。移动Overlay时回到上一次的位置。
	 * */
	public static const EDITORTOOBAR_UNDO:String = "editorToolbarUnDo";
	
	/**
	 * 点击编辑工具栏的重做按钮触发的事件。
	 * */
	public static const EDITORTOOBAR_REDO:String = "editorToolbarReDo";
	
	/**
	 * 点击编辑工具栏的提交按钮触发的事件。向页面提交本次修改。
	 * */
	public static const EDITORTOOBAR_COMMIT:String = "editorToolbarCommit";
	
	/**
	 * 点击编辑工具栏的取消按钮触发的事件。结束编辑状态，回到初始位置。
	 * */
	public static const EDITORTOOBAR_CANCEL:String = "editorToolbarCancel";
	
	//警卫任务
	/**
	 * 设置设备缓冲查询的半径
	 * */
	public static const GUARD_SET_DEVICE_SEARCH_DISTANCE:String = "setDeviceSearchDistance";
	
	/**
	 * 显示保存过的任务路线
	 * */
	public static const GUARD_SHOW_GEOMETRY:String = "showGuardJobGeometry";
	
	/**
	 * 显示保存过的任务相关设备
	 * */
	public static const GUARD_SHOW_DEVICE:String = "showGuardJobDevice";
	
	/**
	 * 编辑警卫任务时，页面删除一个设备后通知flash
	 * */
	public static const GUARD_DELETE_DEVICE_BY_PAGE:String = "deleteGuardJobDeviceByPage";
	
	/**
	 * 新增设备时设置关联的设施设备(路口、道路)
	 * */
	public static const ADD_RELATE_DEVICE:String = "addRelateDevice";
	
	public static const FIND_DEVICE:String = "findDevice";
	
	/**
	 * 设置搜索时的关键字
	 * */
	public static const SET_SEARCH_TEXT:String = "setSearchText";
	
	/**
	 * 设置搜索时的范围
	 * */
	public static const SET_SEARCH_GEOMETRY:String = "setSearchGeometry";
	
	/**
	 * 清除搜索结果
	 * */
	public static const CLEAR_SEARCH_RESULT:String = "clearSearchResult";
	
	 
	 /**
	  *警情
	  * */
	 public static const SET_POLICE_EVENT_DATA:String =  "setPoliceEventData";
	 
	 /* 警情弹出窗口关闭*/
	 public static const CLOSE:String =  "close";
	 
	 /**
	  *交通流量
	  * */
	 public static const GET_TRAFFIC_FLOW_DATA:String =  "getTrafficFlowData";
	 
	 public static const GET_TRAFFIC_FLOW_NOTICE:String =  "getTrafficFlowNotice";
	 
	 public static const DELETE_TRAFFIC_FLOW_DATA:String =  "deleteTrafficFlowData";
	 
	 public static const CHANGE_OVERLAY_VISIBLE:String = "changeOverlayVisible";
	 
	 /**
	 * 打开菜单组件
	 * 某个菜单打开时，其他菜单关闭，保证只打开一个菜单
	 * */
	 public static const OPEN_MENU:String = "openMenu";
	 
	 
	 
	 public static const HUANBAOJU_QUERYEXPRESSION_TIME:String = "HuanBaoJuQueryExpressionTime";
	 
	 public static const HUANBAOJU_QUERYEXPRESSION_TYPE:String = "HuanBaoJuQueryExpressionType";
	 
	 /**
	 * 每个区的信访总数量
	 * */
	 public static const HUANBAOJU_DISTRICT_COUNT:String = "HuanBaoJuDistrictCount";
	 
	 /**
	 * 每个区的分类信访数量
	 * */
	 public static const HUANBAOJU_DISTRICT_TYPE_COUNT:String = "HuanBaoJuDistrictTypeCount";
	 
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function AppEvent(type:String, data:Object = null, callback:Function = null)
    {
        super(type);
        _data = data;
        _callback = callback;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    private var _data:Object;

    private var _callback:Function;

    /**
     * The data will be passed via the event. It allows the event dispatcher to publish
     * data to event listener(s).
     */
    public function get data():Object
    {
        return _data;
    }

    /**
     * @private
     */
    public function set data(value:Object):void
    {
        _data = value;
    }

    /**
     * The callback function associated with this event.
     */
    public function get callback():Function
    {
        return _callback;
    }

    /**
     * @private
     */
    public function set callback(value:Function):void
    {
        _callback = value;
    }

    /**
     * Override clone
     */
    public override function clone():Event
    {
        return new AppEvent(this.type, this.data, this.callback);
    }

    /**
     * Dispatch this event.
     */
    public function dispatch():Boolean
    {
        return EventBus.instance.dispatchEvent(this);
    }

    /**
     * Dispatch an AppEvent for specified type and with optional data and callback reference.
     */
    public static function dispatch(type:String, data:Object = null, callback:Function = null):Boolean
    {
        return EventBus.instance.dispatchEvent(new AppEvent(type, data, callback));
    }

    public static function addListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
    {
        EventBus.instance.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    public static function removeListener(type:String, listener:Function, useCapture:Boolean = false):void
    {
        EventBus.instance.removeEventListener(type, listener, useCapture);
    }

    public static function setStatus(status:String):void
    {
        dispatch(AppEvent.SET_STATUS, status);
    }

    public static function showError(content:String, title:String):void
    {
        var errorMessage:ErrorMessage = new ErrorMessage(content, title);
        dispatch(AppEvent.APP_ERROR, errorMessage);
    }
}

}
