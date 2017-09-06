const Location = require('./location.js')

class UI {
  constructor(container) {
    this.container = container
    this.render()
  }

  render() {
    const location = new Location(this.container, "findhorn")
  }
}

module.exports = UI