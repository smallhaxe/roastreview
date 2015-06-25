window.myMap = {};

myMap.getCafes = function(map) {
  $.ajax({
    dataType: 'text',
    url: '/cafes.json',
    success: function(cafes) {

      geojson = $.parseJSON(cafes);
      // load the markers in the map
      myMap.cafeLayer.setGeoJSON({
        type: "FeatureCollection",
        features: geojson
      });
      // popup behaviour on marker mouseover event
      myMap.cafeLayer.on('mouseover', function(e) {
          e.layer.openPopup();
      });
      myMap.cafeLayer.on('mouseout', function(e) {
          e.layer.closePopup();
      });
      myMap.addCafePopups(map);
    },
    // error:function(){
    //   alert("Could not load the cafes");
    // }
  });
}

// customize the marker events
myMap.addCafePopups = function(map) {
  map.featureLayer.on("layeradd", function(e){

    var marker = e.layer;
    var properties = marker.feature.properties;
    // custom popup content
    var popupContent = '<div class="leaflet-popup">' + '<h3>' + properties.name + '</h3>' +
                    '<h4>' + properties.address + '</h4>' + '</div>';
    marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 300});
    marker.eachLayer(function(e){
      e.openPopup();
    });
  });
}

$(document).on("ready", function(){
  // create the map
  L.mapbox.accessToken = 'pk.eyJ1IjoiY2xheW5lIiwiYSI6IldjZ2gyLW8ifQ.8AtgyePBb8CL3sh_LX2Awg';
  myMap.map = L.mapbox.map('map', 'clayne.i6afai85').setView([37.794, -122.401], 14);
  var geojson;
  // var marker, properties, popupContent;

  myMap.map.featureLayer.on("ready", function(e) {
    myMap.getCafes(myMap.map);
  });
    myMap.cafeLayer = L.mapbox.featureLayer().bindPopup(popupContent);
    myMap.map.addLayer(myMap.cafeLayer);
});
