class Location {
  constructor(container, location) {
    this.container = container
    this.location = location
    this.render()
  }

  render() {
    const p = document.createElement('p')
    p.innerText = this.location
    this.container.appendChild(p)
  }
}

module.exports = Location