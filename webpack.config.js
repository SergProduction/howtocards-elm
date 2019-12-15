const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MinifyPlugin = require("babel-minify-webpack-plugin")
const merge = require('webpack-merge')


const elmLoader = (isProd) => ({
  test: /\.elm$/,
  exclude: [/elm-stuff/, /node_modules/],
  use: {
    loader: 'elm-webpack-loader',
    options: {
      optimize: isProd ? true : false
    }
  }
})

const dev = {
  devtool: 'source-map',
  devServer: {
    open: true,
    port: 3000,
    host: 'localhost',
    compress: true,
    contentBase: "./dist",
    historyApiFallback: {
      from: /(\/\w+)+/,
      to: '/',
    },
  },
  module: {
    rules: [elmLoader(false)]
  },
}

const prod = {
  module: {
    rules: [
      elmLoader(true),
    ]
  },
  plugins: [
    new MinifyPlugin({
      mangle: { topLevel: true }
    })
  ]
}

const common = {
  module: {
    rules: [
      {
        test: /\.less$/,
        use: [
          {
            loader: 'file-loader', 
            options: {
              name: "[name].css",
            },
          },
          { loader: 'extract-loader' },
          { loader: 'css-loader' },
          { loader: 'less-loader' },
        ],
      },
      {
        test: /\.css$/,
        use: [
          { loader: 'file-loader' },
        ],
      },
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: `./src/index.ejs`,
    }),
  ],
}


module.exports = function(env, argv) {
  if (argv.mode === 'production') {
    return merge([
      common,
      prod,
    ])
  }
  if (argv.mode === 'development') {
    return merge([
      common,
      dev,
    ])
  }
}