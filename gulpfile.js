var gulp = require('gulp')
var sass = require('gulp-sass')
// var rename = require('gulp-rename')
var gulpSequence = require('gulp-sequence')
var coffee = require('gulp-coffee')
var concat = require('gulp-concat')
var path = require('path')
var del = require('del')

const config = {
  src: 'src',
  dist: 'dist'
}

const paths = require('./path-config')(config)

gulp.task('clean', function () {
  return del(paths.build.dist)
})

gulp.task('root', function () {
  return gulp
    .src(path.resolve(paths.src.root, '*.html'))
    .pipe(gulp.dest(paths.build.dist))
})

gulp.task('sass', function () {
  return gulp
    .src(path.resolve(paths.src.styles, '**/*.scss'))
    .pipe(sass())
    .pipe(gulp.dest(paths.build.styles))
})

gulp.task('css', function () {
  return gulp
    .src(path.resolve(paths.src.styles, '**/*.css'))
    .pipe(gulp.dest(paths.build.styles))
})

gulp.task('scripts', ['coffee'], function () {

})

gulp.task('coffee', function () {
  return gulp
    .src(path.resolve(paths.src.scripts, '**/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(concat('main.js'))
    .pipe(gulp.dest(paths.build.scripts))
})

gulp.task('views', function () {
  return gulp
    .src(path.resolve(paths.src.views, '**/*'))
    .pipe(gulp.dest(paths.build.views))
})

gulp.task('assets', function () {
  return gulp
    .src(path.resolve(paths.src.assets, '**/*'))
    .pipe(gulp.dest(paths.build.assets))
})

gulp.task('angular', ['angular-route', 'angular-sanitize', 'angular-animate', 'angular-filter'], function () {
  return gulp
    .src([paths.src.angular.js, paths.src.angular.map])
    .pipe(gulp.dest(paths.build.vendor))
})

gulp.task('angular-route', function () {
  return gulp
    .src([paths.src.angular.route.js, paths.src.angular.route.map])
    .pipe(gulp.dest(paths.build.vendor))
})

gulp.task('angular-sanitize', function () {
  return gulp
    .src([paths.src.angular.sanitize.js, paths.src.angular.sanitize.map])
    .pipe(gulp.dest(paths.build.vendor))
})

gulp.task('angular-animate', function () {
  return gulp
    .src([paths.src.angular.animate.js, paths.src.angular.animate.map])
    .pipe(gulp.dest(paths.build.vendor))
})

gulp.task('angular-filter', function () {
  return gulp
    .src(paths.src.angular.filter.js)
    .pipe(gulp.dest(paths.build.vendor))
})

gulp.task('app', ['sass', 'css', 'scripts', 'views', 'assets', 'angular'], function () {
  return gulp
    .src(path.resolve(paths.src.root, 'karriere.html'))
    .pipe(gulp.dest(paths.build.dist))
})

gulp.task('watch-app', function () {
  return gulp
    .watch(path.resolve(paths.src.root), ['dev'])
    .on('change', function (event) {
      console.log('File ' + event.path + ' was ' + event.type + ', running tasks...')
    })
})

gulp.task('watch', ['watch-app'], function () {

})

gulp.task('dev', function (cb) {
  gulpSequence('clean', ['app'])(cb)
})

gulp.task('build', function (cb) {
  gulpSequence('clean', ['app'])(cb)
})

gulp.task('default', ['build'], function () {
  // place code for your default task here
})
