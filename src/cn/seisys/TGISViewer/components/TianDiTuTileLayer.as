package cn.seisys.TGISViewer.components
{
	import com.esri.ags.SpatialReference;
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.layers.WMTSLayer;
	import com.esri.ags.layers.supportClasses.LOD;
	import com.esri.ags.layers.supportClasses.TileInfo;
	
	import flash.net.URLRequest;
	
	public class TianDiTuTileLayer extends WMTSLayer
	{
		public function TianDiTuTileLayer( url:String = null )
		{
			super( url );
			
			buildTileInfo();
			setLoaded( true );
		}
		
		private var _tileInfo:TileInfo = new TileInfo();  
		private var _url:String = new String();  
		
		override public function get fullExtent():Extent  
		{  
			return new Extent(-180, -90, 180, 90, new SpatialReference(4326));  
		} 
		
		override public function get spatialReference():SpatialReference  
		{  
			return new SpatialReference(4326);  
		}  
		
		override public function get tileInfo():TileInfo  
		{     
			return _tileInfo;  
		} 
		
		override protected function getTileURL(level:Number, row:Number, col:Number):URLRequest  
		{  
			var requestUrl:String;
			requestUrl = url  + "?service=wmts&request=gettile&version=1.0.0" + 
				"&layer=" + this.layerId + 
				"&format=" + this.imageFormat + 
				"&tilematrixset=" + this.tileMatrixSetId + 
				"&style=" + this.style + 
				"&servicemode=" + this.serviceMode +
				"&tilecol=" + col + 
				"&tilerow=" + row + 
				"&tilematrix=" + ( level );
			return new URLRequest( requestUrl ) ;  
		}  
		
		private function buildTileInfo():void  
		{  
			_tileInfo.height = 256;  
			_tileInfo.width = 256;  
			_tileInfo.origin = new MapPoint( -180, 90 );  
			_tileInfo.spatialReference = new SpatialReference( 4326 );  
			_tileInfo.lods = [      
				new LOD( 1, 0.7031249999891485, 2.958293554545656E8 ),  
				new LOD( 2, 0.35156249999999994, 1.479146777272828E8 ),  
				new LOD( 3, 0.17578124999999997, 7.39573388636414E7 ),  
				new LOD( 4, 0.08789062500000014, 3.69786694318207E7 ),  
				new LOD( 5, 0.04394531250000007, 1.848933471591035E7 ),  
				new LOD( 6, 0.021972656250000007, 9244667.357955175 ),  
				new LOD( 7, 0.01098632812500002, 4622333.678977588 ),  
				new LOD( 8, 0.00549316406250001, 2311166.839488794 ),  
				new LOD( 9, 0.0027465820312500017, 1155583.419744397 ),  
				new LOD( 10, 0.0013732910156250009, 577791.7098721985 ),  
				new LOD( 11, 0.000686645507812499, 288895.85493609926 ),  
				new LOD( 12, 0.0003433227539062495, 144447.92746804963 ),  
				new LOD( 13, 0.00017166137695312503, 72223.96373402482 ),  
				new LOD( 14, 0.00008583068847656251, 36111.98186701241 ),  
				new LOD( 15, 0.000042915344238281406, 18055.990933506204 ),  
				new LOD( 16, 0.000021457672119140645, 9027.995466753102 ),  
				new LOD( 17, 0.000010728836059570307, 4513.997733376551 ),   
				new LOD( 18, 0.000005364418029785169, 2256.998866688275 )
			];  
		}  
	}
}