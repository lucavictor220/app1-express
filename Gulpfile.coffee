Gulp = require 'gulp'
Sass = require 'gulp-sass'
Gutil = require 'gulp-util'
Coffeeify = require 'gulp-coffeeify'
LiveReload = require 'gulp-livereload'


Gulp.task 'sass', ->
  Gulp.src 'assets/css/*.sass'
    .pipe Sass().on 'error', Sass.logError
    .pipe Gulp.dest 'public/css'
    .pipe LiveReload()

Gulp.task 'coffee', ->
  Gulp.src 'assets/js/*.coffee'
    .pipe Coffeeify()
    .pipe Gulp.dest 'public/javascripts'

Gulp.task 'watch:sass', ->
  LiveReload.listen()
  Gulp.watch 'assets/css/*.sass', ['sass']

Gulp.task 'watch:coffee', ->
  Gulp.watch 'assets/js/*.coffee', ['coffee']

Gulp.task 'default', ['sass', 'coffee', 'watch:sass', 'watch:coffee']
