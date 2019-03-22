window.Application = {}
window.Application.Classes = {}

class Application.Classes.MainMap

  constructor: ->
    @polygons = []
    @initMap(document.getElementById('map'))
    @showPolygons()
    @showAddreses()


  initMap: (element) =>
    @map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: {lat: 55.756196, lng: 37.620535},
    });

  showPolygons: =>
    xhr = new XMLHttpRequest();
    xhr.open('GET', 'polygons.json', true);
    xhr.send();

    xhr.onreadystatechange = =>

      return if (xhr.readyState != 4)

      if (xhr.status == 200)
        @places = JSON.parse(xhr.responseText)
        @places.forEach (place) =>
          color = place.color
          multypolygonCoordinates = place.geo_area.geometry.coordinates

          multypolygonCoordinates.forEach (polygonCoordinates) =>
            polygonCoordinates.forEach (polygon) =>
              polygonCoords = polygon.map (point) -> { lat: point[0], lng: point[1] }
              googlePolygon = new google.maps.Polygon({
                paths: polygonCoords,
                strokeColor: color,
                strokeOpacity: 0.8,
                strokeWeight: 3,
                fillColor: color,
                fillOpacity: 0.35
              });

              googlePolygon.setMap(@map);

  showAddreses: =>
    xhr = new XMLHttpRequest();
    xhr.open('GET', 'addresses.json', true);
    xhr.send();

    xhr.onreadystatechange = =>
      return if (xhr.readyState != 4)

      _pinIcon = (color) ->
        {
          path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z M -2,-30 a 2,2 0 1,1 4,0 2,2 0 1,1 -4,0',
          fillColor: color,
          fillOpacity: 1,
          strokeColor: '#000',
          strokeWeight: 2,
          scale: 1
        }

      if (xhr.status == 200)
        @address = JSON.parse(xhr.responseText)
        @address.forEach (address) =>
          coordinates = address.geo_point.geometry.coordinates

          marker = new google.maps.Marker({
            map: @map,
            position: new google.maps.LatLng(coordinates[0], coordinates[1])
            icon: _pinIcon(address.color)
          })