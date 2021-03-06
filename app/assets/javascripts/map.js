window.myMap = {};

$(document).on("ready", function(){
  // create the map
  L.mapbox.accessToken = 'pk.eyJ1IjoiY2xheW5lIiwiYSI6IldjZ2gyLW8ifQ.8AtgyePBb8CL3sh_LX2Awg';
  myMap.map = L.mapbox.map('map', 'clayne.i6afai85').setView([37.794, -122.401], 14);
  var geojson;
  var marker;
  var properties;
  var popupContent;

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
          myMap.cafeLayer.on("mouseover", function(e){
            marker = e.layer;
            properties = marker.feature.properties;
            popupContent = '<div class="leaflet-popup">' + '<h3>' + properties.name + '</h3>' +
                            '<h4>' + properties.address + '</h4>' + '</div>';
            marker.bindPopup(popupContent, {
              closeButton: false,
              minWidth: 320,
              minHeight: 200
            //styles in here
          });
          marker.openPopup();
        });
        myMap.map.fitBounds(myMap.cafeLayer.getBounds());
        myMap.cafeLayer.on('mouseout', function(e) {
            marker.closePopup();
        });
      },
      error:function(){
        alert("Could not load the cafes");
      }
    });
  }
  myMap.cafeLayer = L.mapbox.featureLayer();
  myMap.map.addLayer(myMap.cafeLayer);
  myMap.map.featureLayer.on("ready", function(e) {
    myMap.getCafes(myMap.map);
    // myMap.map.fitBounds(myMap.cafeLayer.getBounds());
  });

  // myMap.cafeLayer.on('ready', function(){
  //   myMap.map.fitBounds(myMap.cafeLayer.getBounds());
  // });

});
