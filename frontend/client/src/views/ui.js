const Chart = require('./chart')

class UI {
  constructor(container, responseText) {
    this.container = container
    this.render(responseText)
  }

  createContainer(id) {
    const container = document.createElement('div')
    container.id = id
    this.container.appendChild(container)
    return container
  }

  render(responseText) {
    const chartContainer = this.createContainer('chart-container')
    const chart = new Chart(chartContainer, responseText)
  }
}

module.exports = UI