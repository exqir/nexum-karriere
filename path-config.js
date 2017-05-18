'use strict'

const path = require('path')

module.exports = function (config) {
  const paths = {
    src: {
      nodeModules: path.resolve(__dirname, 'node_modules'),
      scripts: path.resolve(__dirname, config.src, 'scripts'),
      styles: path.resolve(__dirname, config.src, 'styles'),
      views: path.resolve(__dirname, config.src, 'views'),
      assets: path.resolve(__dirname, config.src, 'assets'),
      root: path.resolve(__dirname, config.src)
    },
    build: {
      dist: path.resolve(__dirname, config.dist),
      vendor: path.resolve(__dirname, config.dist, 'vendor'),
      assets: path.resolve(__dirname, config.dist, 'assets'),
      scripts: path.resolve(__dirname, config.dist, 'scripts'),
      fonts: path.resolve(__dirname, config.dist, 'fonts'),
      styles: path.resolve(__dirname, config.dist, 'styles'),
      views: path.resolve(__dirname, config.dist, 'views')
    }
  }

  paths.src.angular = {
    js: path.resolve(paths.src.nodeModules, 'angular/angular.min.js'),
    map: path.resolve(paths.src.nodeModules, 'angular/angular.min.js.map'),
    route: {
      js: path.resolve(paths.src.nodeModules, 'angular-route/angular-route.min.js'),
      map: path.resolve(paths.src.nodeModules, 'angular-route/angular-route.min.js.map')
    },
    sanitize: {
      js: path.resolve(paths.src.nodeModules, 'angular-sanitize/angular-sanitize.min.js'),
      map: path.resolve(paths.src.nodeModules, 'angular-sanitize/angular-sanitize.min.js.map')
    },
    animate: {
      js: path.resolve(paths.src.nodeModules, 'angular-animate/angular-animate.min.js'),
      map: path.resolve(paths.src.nodeModules, 'angular-animate/angular-animate.min.js.map')
    },
    filter: {
      js: path.resolve(paths.src.nodeModules, 'angular-filter/dist/angular-filter.min.js')
    }
  }

  return paths
}
