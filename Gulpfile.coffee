Gulp = require 'gulp'
Sass = require 'gulp-sass'
Gutil = require 'gulp-util'
Coffeeify = require 'gulp-coffeeify'
Concat = require 'gulp-concat'
LiveReload = require 'gulp-livereload'

LibsPaths =
  js: [
    'bower_components/jquery/dist/jquery.js',
    'bower_components/underscore/underscore.js'
  ]


Gulp.task 'sass', ->
  Gulp.src 'assets/css/*.sass'
    .pipe Sass().on 'error', Sass.logError
    .pipe Gulp.dest 'app/css'
    .pipe LiveReload()

Gulp.task 'coffee', ->
  Gulp.src 'assets/**/*.coffee'
    .pipe Coffeeify()
    .pipe Gulp.dest 'app/javascripts'

Gulp.task 'templates', ->
  Gulp.src 'assets/**/*.coffee'
    .pipe Coffeeify()
    .pipe Gulp.dest 'app/javascripts'

Gulp.task 'watch:sass', ->
  LiveReload.listen()
  Gulp.watch 'assets/css/*.sass', ['sass']

Gulp.task 'watch:coffee', ->
  Gulp.watch 'assets/**/*.coffee', ['coffee']

Gulp.task 'vendor', ->
  Gulp.src LibsPaths.js
    .pipe Concat('vendor.js')
    .pipe Gulp.dest 'app'

Gulp.task 'watch:templates', ->
  Gulp.src 'views/*.jade'
  .pipe LiveReload()

Gulp.watch 'views/*.jade', ['watch:templates']

Gulp.task 'default', ['sass', 'coffee', 'watch:sass', 'watch:coffee', 'watch:templates', 'vendor']
