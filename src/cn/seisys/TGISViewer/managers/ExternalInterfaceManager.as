package cn.seisys.TGISViewer.managers
{
	import com.esri.ags.geometry.MapPoint;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	
	import cn.seisys.TGISViewer.AppEvent;
	import cn.seisys.TGISViewer.ViewerContainer;
	
	public class ExternalInterfaceManager extends EventDispatcher
	{
		public function ExternalInterfaceManager(target:IEventDispatcher=null)
		{
			super(target);
			AppEvent.addListener( ViewerContainer.CONTAINER_INITIALIZED, init );
		}
		
		private function init( event:Event ):void
		{
			registerCallback();
			
			AppEvent.addListener( AppEvent.EXTERNALINTERFACE_CALL, externalInterfaceCall );
			
			var registerTimer:Timer = new Timer( 5000 );
			registerTimer.addEventListener( TimerEvent.TIMER, timerEvent );
			registerTimer.start();
		}
		
		private function timerEvent( event:TimerEvent ):void
		{
			registerCallback();
		}
		
		private function registerCallback():void
		{
			ExternalInterface.addCallback( "addPoints", dispatchAddPointsEvent );
			ExternalInterface.addCallback( "addPointsByPage", dispatchAddPointsByPageEvent );
			ExternalInterface.addCallback( "deleteAllPoints", dispatchDeleteAllPointsEvent );
			ExternalInterface.addCallback( "deletePoints", dispatchDeletePointsEvent );
			
			ExternalInterface.addCallback( "addTexts", dispatchAddTextsEvent );
			ExternalInterface.addCallback( "deleteAllTexts", dispatchDeleteAllTextsEvent );
			ExternalInterface.addCallback( "deleteTexts", dispatchDeleteTextsEvent );
			
			ExternalInterface.addCallback( "addLines", dispatchAddLinesEvent );
			ExternalInterface.addCallback( "deleteAllLines", dispatchDeleteAllLinesEvent );
			ExternalInterface.addCallback( "deleteLines", dispatchDeleteLines );
			
			ExternalInterface.addCallback( "addPolygons", dispatchAddPolygonsEvent );
			ExternalInterface.addCallback( "deletePolygons", dispatchDeletePolygonsEvent );
			ExternalInterface.addCallback( "deleteAllPolygons", dispatchDeleteAllPolygonsEvent );
			
			ExternalInterface.addCallback( "openWidget", dispatchOpenWidgetEvent );
			ExternalInterface.addCallback( "closeWidget", dispatchCloseWidgetEvent );
			
			ExternalInterface.addCallback( "showLayer", dispatchShowLayerEvent );
			ExternalInterface.addCallback( "hideLayer", dispatchHideLayerEvent );
			
			ExternalInterface.addCallback( "setMapCenter", dispatchSetMapCenterEvent );
			ExternalInterface.addCallback( "setMapScale", dispatchSetMapScaleEvent );
			ExternalInterface.addCallback( "setMapExtent", dispatchSetMapExtentEvent );
			ExternalInterface.addCallback( "locatorMapByName", dispatchLocatorMapByNameEvent );
			ExternalInterface.addCallback( "refreshMap", dispatchRefreshMapEvent );
			
			ExternalInterface.addCallback( "hideInfoPopUp", dispatchHideInfoPopUpEvent );
			
			ExternalInterface.addCallback( "getDeviceCoordinate", dispatchGetDeviceCoordinateEvent );
			
			ExternalInterface.addCallback( "findDevice", dispatchFindDeviceEvent );
			
			ExternalInterface.addCallback( "showTravelTime", dispatchShowTravelTimeEvent );
			ExternalInterface.addCallback( "hideTravelTime", dispatchHideTravelTimeEvent );
			
			ExternalInterface.addCallback( "addCarTrack", dispatchAddCarTrackEvent );
			ExternalInterface.addCallback( "deleteCarTrack", dispatchDeleteCarTrackEvent );
			ExternalInterface.addCallback( "deleteAllCarTrack", dispatchDeleteAllCarTrackEvent );
			
			ExternalInterface.addCallback( "bufferSearch", dispatchBufferSearchEvent );
			
			ExternalInterface.addCallback( "clearSelection", dispatchClearSelectionEvent );
			
			ExternalInterface.addCallback( "setRelateXHD", dispatchSetRelateXHDEvent );
			
			ExternalInterface.addCallback( "changeStaticImage", changeStaticImageHandler );
			
			ExternalInterface.addCallback( "addGPSTrack", dispatchAddGPSTrackEvent );
			ExternalInterface.addCallback( "deleteAllGPSTrack", dispatchDeleteAllGPSTrackEvent );
			
			ExternalInterface.addCallback( "drawPointBuffer", dispatchDrawPointBufferEvent );
			ExternalInterface.addCallback( "addBuffers", dispatchDrawBufferEvent );
			
			ExternalInterface.addCallback( "changeLayerVisibility", dispatchChangeLayerVisibilityEvent );
			
			ExternalInterface.addCallback( "setLayerFilter", dispatchSetLayerFilterDefinitionEvent );
			
			ExternalInterface.addCallback( "startEditGeometry", dispatchStartEditEvent );
			ExternalInterface.addCallback( "startEdit", dispatchStartEditEvent );
			ExternalInterface.addCallback( "stopEdit", dispatchStopEditEvent );
			ExternalInterface.addCallback( "startAdd", dispatchStartAddEvent );
			ExternalInterface.addCallback( "stopAdd", dispatchStopAddEvent );
			
			//警卫任务
			ExternalInterface.addCallback( "setDeviceSearchDistance", dispatchSetDeviceSearchDistanceEvent );
			ExternalInterface.addCallback( "showGuardJobGeometry", dispatchShowGuardJobGeometryEvent );
			ExternalInterface.addCallback( "showGuardJobDevice", dispatchShowGuardJobDeviceEvent );
			ExternalInterface.addCallback( "deleteRelateDeviceByPage", dispatchDeleteRelateDeviceByPageEvent );
			
			//设置搜索条件
			ExternalInterface.addCallback( "setSearchGeometry", dispatchSetSearchGeometryEvent );
			ExternalInterface.addCallback( "clearSearchResult", dispatchClearSearchResult );
		}
		
		private function dispatchClearSearchResult():void
		{
			AppEvent.dispatch( AppEvent.CLEAR_BUFFER_SEARCH );
		}
		
		private function dispatchSetSearchGeometryEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.SET_SEARCH_GEOMETRY, param );
		}
		
		private function dispatchFindDeviceEvent( type:String, id:String ):void
		{
			AppEvent.dispatch( AppEvent.FIND_DEVICE, { type: type, id: id } );
		}
		
		private function dispatchAddPolygonsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_POLYGONS, param );
		}
		
		private function dispatchDeletePolygonsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_POLYGONS, param );
		}
		
		private function dispatchDeleteAllPolygonsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_ALL_POLYGONS, param );
		}
		
		private function dispatchShowGuardJobGeometryEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.GUARD_SHOW_GEOMETRY, param );
		}
		
		private function dispatchShowGuardJobDeviceEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.GUARD_SHOW_DEVICE, param );
		}
		
		private function dispatchSetDeviceSearchDistanceEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.GUARD_SET_DEVICE_SEARCH_DISTANCE, param );
		}
		
		private function dispatchDeleteRelateDeviceByPageEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.GUARD_DELETE_DEVICE_BY_PAGE, param );
		}
		
		private function dispatchStartAddEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.START_ADD_OVERLAY, param );
		}
		
		private function dispatchStopAddEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.STOP_ADD_OVERLAY, param );
		}
		
		private function dispatchStartEditEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.START_MOVE_OVERLAY, param );
		}
		
		private function dispatchStopEditEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.STOP_EDIT_OVERLAY, param );
		}
		
		private function dispatchSetLayerFilterDefinitionEvent( whereClause:String, serviceName:String = "", layerIds:String = "" ):void
		{
			AppEvent.dispatch( AppEvent.SET_LAYER_FILTER_DEFINITION, 
				{ 
					serviceName: serviceName,
					layerIds: layerIds,
					whereClause: whereClause
				} 
			);
		}
		
		private function dispatchRefreshMapEvent():void
		{
			AppEvent.dispatch( AppEvent.REFRESH_MAP );
		}
		
		private function dispatchLocatorMapByNameEvent( name:String ):void
		{
			AppEvent.dispatch( AppEvent.LOCATOR_MAP_BY_NAME, name );
		}
		
		private function dispatchChangeLayerVisibilityEvent( serviceName:String, layerIds:String, visible:Boolean ):void
		{
			AppEvent.dispatch( AppEvent.CHANGE_LAYER_VISIBILITY_BY_NAME, 
				{ 
					serviceName: serviceName,
					layerIds: layerIds,
					visible: visible
				} 
			);
		}
		
		/**
		 * 专门用来做点缓冲
		 * */
		private function dispatchDrawPointBufferEvent( x:Number, y:Number, distance:Number ):void
		{
			if ( isNaN( x ) || isNaN( y ) || isNaN( distance ) )
			{
				return;
			}
			
			AppEvent.dispatch( AppEvent.DRAW_BUFFER, 
				{ 
					geometry: new MapPoint( x, y ),
					distance: distance 
				} 
			);
		}
		
		/**
		 * 通用的点\线\面缓冲
		 * */
		private function dispatchDrawBufferEvent( param:String ):void
		{
			
		}
		
		private function dispatchDeleteAllGPSTrackEvent( params:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_ALL_GPS_TRACK, params );
		}
		
		private function dispatchAddGPSTrackEvent( params:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_GPS_TRACK, params );
		}
		
		private function changeStaticImageHandler( imageUrl:String ):void
		{
			var data:Object =
				{
					key: "imageurl",
					collection: new ArrayCollection( [ imageUrl ] )
				};
			AppEvent.dispatch(AppEvent.DATA_PUBLISH, data);
		}
		
		private function dispatchSetRelateXHDEvent( params:String ):void
		{
			AppEvent.dispatch( AppEvent.SET_RELATE_XHD, params );
		}
		
		private function dispatchClearSelectionEvent():void
		{
			AppEvent.dispatch( AppEvent.CLEAR_SELECTION );
		}
		
		private function dispatchBufferSearchEvent( type:String, x:Number, y:Number, distance:Number, token:String = "" ):void
		{
			var pt:MapPoint = new MapPoint( x, y );
			AppEvent.dispatch( AppEvent.BUFFER_SEARCH, 
				{ 
					type: type, 
					id: "", 
					point: pt, 
					distance: distance,
					token: token
				} 
			);
		}
		
		private function dispatchAddCarTrackEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_CAR_TRACK, param );
		}
		
		private function dispatchDeleteCarTrackEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_CAR_TRACK, param );
		}
		
		private function dispatchDeleteAllCarTrackEvent():void
		{
			AppEvent.dispatch( AppEvent.DELETE_ALL_CAR_TRACK );
		}
		
		private function dispatchAddPointsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_POINTS, param );
		}
		
		private function dispatchAddPointsByPageEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_POINTS_BY_PAGE, param );
		}
		
		private function dispatchDeleteAllPointsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_ALL_POINTS, param );
		}
		
		private function dispatchDeletePointsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_POINTS, param );
		}
		
		private function dispatchAddTextsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_TEXTS, param );
		}
		
		private function dispatchDeleteAllTextsEvent( param:String ):void
		{
			AppEvent.dispatch(  AppEvent.DELETE_ALL_TEXTS, param);
		}
		
		private function dispatchDeleteTextsEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_TEXTS, param );
		}
		
		private function dispatchAddLinesEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_LINES, param );
		}
		
		private function dispatchDeleteAllLinesEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_ALL_LINES, param );
		}
		
		private function dispatchDeleteLines( param:String ):void
		{
			AppEvent.dispatch( AppEvent.DELETE_LINES, param );
		}
		
		private function dispatchOpenWidgetEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.WIDGET_RUN, param );
		}
		
		private function dispatchCloseWidgetEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.WIDGET_CLOSE, param );
		}
		
		private function dispatchShowLayerEvent( serviceName:String, layerIds:String ):void
		{
			AppEvent.dispatch( AppEvent.CHANGE_LAYER_VISIBILITY_BY_NAME, 
				{ 
					serviceName:serviceName,
					layerIds:layerIds,
					visible:true
				} );
		}
		
		private function dispatchHideLayerEvent( serviceName:String, layerIds:String ):void
		{
			AppEvent.dispatch( AppEvent.CHANGE_LAYER_VISIBILITY_BY_NAME, 
				{ 
					serviceName:serviceName,
					layerIds:layerIds,
					visible:false
				} );
		}
		
		private function dispatchSetMapCenterEvent( x:Number, y:Number ):void
		{
			AppEvent.dispatch( AppEvent.SET_MAP_CENTER, 
				{ 
					x:x, 
					y:y 
				} 
			);
		}
		
		private function dispatchSetMapScaleEvent( scale:Number ):void
		{
			AppEvent.dispatch( AppEvent.SET_MAP_SCALE, scale );
		}
		
		private function dispatchSetMapExtentEvent( xMin:Number, yMin:Number, xMax:Number, yMax:Number ):void
		{
			AppEvent.dispatch( AppEvent.SET_MAP_EXTENT, 
				{ 
					xMin:xMin, 
					yMin:yMin, 
					xMax:xMax, 
					yMax:yMax 
				} 
			);
		}
		
		private function dispatchHideInfoPopUpEvent():void
		{
			AppEvent.dispatch( AppEvent.HIDE_INFO_POPUP );
		}
		
		private function dispatchGetDeviceCoordinateEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.GET_DEVICE_COORDINATE, param );
		}
		
		private function dispatchShowTravelTimeEvent( param:String ):void
		{
			AppEvent.dispatch( AppEvent.ADD_TRAVEL_TIME, param );
		}
		
		private function dispatchHideTravelTimeEvent():void
		{
			AppEvent.dispatch( AppEvent.DELETE_TRAVEL_TIME );
		}
		
		private function externalInterfaceCall( event:AppEvent ):void
		{
			var functionName:String = event.data.functionName;
			var paramArray:Array = event.data.params;
			trace( functionName );
			if ( !paramArray || paramArray.length == 0 ) 
			{
				ExternalInterface.call( functionName );
			}
			else 
			{
				var paramStr:String = "";
				for (var i:int = 0; i < paramArray.length; i++)  
				{
					paramStr += ( paramArray[i] ? paramArray[i].toString() : "" ) + ",";
				}
				trace( paramStr );
				switch ( paramArray.length ) 
				{
					case 1:
						ExternalInterface.call( functionName, paramArray[0] );
						break;
					case 2:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1] );
						break;
					case 3:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2] );
						break;
					case 4:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3] );
						break;
					case 5:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3], paramArray[4] );
						break;
					case 6:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3], paramArray[4], paramArray[5] );
						break;
					case 7:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3], paramArray[4], paramArray[5], paramArray[6] );
						break;
					case 8:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3], paramArray[4], paramArray[5], paramArray[6],
							paramArray[7] );
						break;
					case 9:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3], paramArray[4], paramArray[5], paramArray[6],
							paramArray[7], paramArray[8] );
						break;
					case 10:
						ExternalInterface.call( functionName, paramArray[0], paramArray[1], paramArray[2], 
							paramArray[3], paramArray[4], paramArray[5], paramArray[6],
							paramArray[7], paramArray[8], paramArray[9] );
						break;
				}
			}
		}
	}
}
