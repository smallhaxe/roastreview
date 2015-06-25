$(document).on("ready", function(){
  // create the map
  L.mapbox.accessToken = 'pk.eyJ1IjoiY2xheW5lIiwiYSI6IldjZ2gyLW8ifQ.8AtgyePBb8CL3sh_LX2Awg';
  var map = L.mapbox.map('map', 'clayne.i6afai85').setView([37.794, -122.401], 14);
  var geojson;
  var marker, properties, popupContent;
  var cafeLayer = L.mapbox.featureLayer().addTo(map);
  map.featureLayer.on("ready", function(e) {
    getCafes(map);
  });

  function getCafes(map) {
    $.ajax({
      dataType: 'text',
      url: '/cafes.json',
      success: function(cafes) {

        geojson = $.parseJSON(cafes);
        // load the markers in the map
        cafeLayer.setGeoJSON({
          type: "FeatureCollection",
          features: geojson
        });
        // popup behaviour on marker mouseover event
        cafeLayer.on('mouseover', function(e) {
            e.layer.openPopup();
        });
        cafeLayer.on('mouseout', function(e) {
            e.layer.closePopup();
        });
        addCafePopups(map);
      },
      // error:function(){
      //   alert("Could not load the cafes");
      // }
    });
  }

  // customize the marker events
  function addCafePopups(map) {
    map.featureLayer.on("layeradd", function(e){

      marker = e.layer;
      properties = marker.feature.properties;
      // custom popup content
      popupContent = '<div class="leaflet-popup">' + '<h3>' + properties.name + '</h3>' +
                      '<h4>' + properties.address + '</h4>' + '</div>';
      marker.bindPopup(popupContent, {
        closeButton: false,
        minWidth: 300});
      marker.on('click', '.trigger', function(e){
        alert('Hello from Toronto!');
      })
    });
  }

});
