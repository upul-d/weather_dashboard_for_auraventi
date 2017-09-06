class Chart {
  constructor(container, title, data) {
    this.container = container
    this.title = title
    this.data = data
    this.render()
  }

  render() {
    const p = document.createElement('p')
    p.innerText = this.location
    this.container.appendChild(p)
  }
}

module.exports = Location