class Request {
  get(url, callback) {

    fetch(url)
      .then(function(thing) {
        console.log(thing)
      })

  }
}

module.exports = Request