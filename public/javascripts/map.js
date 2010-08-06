var map, layer;
var proj_4326 = new OpenLayers.Projection("EPSG:4326");
var proj_900913 = new OpenLayers.Projection("EPSG:900913");

function initOpenLayerMap(lon, lat, div) {
	origin = new OpenLayers.Geometry.Point(lon, lat);
	
	map = new OpenLayers.Map(div, {displayProjection: proj_4326, controls: []});
	map.addControl(new OpenLayers.Control.MouseToolbar());
	map.addControl(new OpenLayers.Control.ZoomPanel());

	layer = new OpenLayers.Layer.OSM();
	
	var markers = new OpenLayers.Layer.Markers( "Markers" );
	var size = new OpenLayers.Size(20,27);
	var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
	var icon = new OpenLayers.Icon('/images/marker.png', size, offset);
	
	marker = new OpenLayers.Marker(new OpenLayers.LonLat(lon, lat).transform(proj_4326, proj_900913), icon);
	markers.addMarker( marker );
	
	map.addLayer(layer);
	map.addLayer(markers);
	map.setCenter( new OpenLayers.LonLat(lon, lat).transform(proj_4326, proj_900913), 14);


}