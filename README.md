# Roast Review

### This is our markdown document where we will post everything related to our product.
=====

## CODE SNIPPETS, WHEE!

### Wyatt's Code Snippet
```
it "displays an error when user's first name is not entered" do
        visit "/users"
        click_link "New User"
        expect(page).to have_content("New User")    

        fill_in "First name", with: ""
        fill_in "Last name", with: "Montana"
        fill_in "Email", with: "joe@montana.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create User"

        expect(page).to_not have_content("User was successfully created.")
    end
```
### Celeste's Code Snippets
```    
    @cafejson = Array.new

    @cafes.each do |cafe|
      @cafejson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [cafe.longitude, cafe.latitude]
        },
        properties: {
          name: cafe.name,
          address: cafe.address,
          :'marker-color' => '#000000',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
```
-----
```
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
```

### Mike's Code Snippet
```

```

### Ugo's Code Snippet
```

```
