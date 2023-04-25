import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static targets = ["input", "coordinates"]

  initialize() {
    this.token = "YOUR-API-KEY"
  }

  geocode(event) {
    event.preventDefault()
    const address = this.inputTarget.value
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${this.token}`)
      .then(response => response.json())
      .then(data => {
        const longitude = data.features[0].center[0]
        const latitude = data.features[0].center[1]
        this.#insertCoordinates(longitude, latitude)
        this.#insertMap(longitude, latitude)
      })
  }

  #insertCoordinates(longitude, latitude) {
    this.coordinatesTarget.innerText = `${latitude}, ${longitude}`
  }

  #insertMap(longitude, latitude) {
    mapboxgl.accessToken = this.token
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v9",
      center: [ longitude, latitude ],
      zoom: 12
    })
    new mapboxgl.Marker()
      .setLngLat([ longitude, latitude ])
      .addTo(map)
  }
}
