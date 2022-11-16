function initMap() {
  const coords = document.getElementById("driver-location");
  const location = {
    lat: coords.getAttribute("data-latitude"),
    lng: coords.getAttribute("data-longitude")
  };
  
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 10,
    center: location
  });

  const marker = new google.maps.Marker({
    position: {
      lat: coords.getAttribute("data-latitude"),
      lng: coords.getAttribute("data-longitude")
    },
    map: map
  });
}
                      
window.initMap = initMap;
