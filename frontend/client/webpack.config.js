var config = {
  entry: __dirname + '/src/app.js',
  output: {
    path: __dirname + '/build',
    filename: 'bundle.js'
  },
  devtool: "source-map"
};

module.exports = config;
