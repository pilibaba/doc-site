'use strict';

var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var cssnano = require('cssnano');

gulp.task('useref', function () {
  var assets = $.useref.assets({
    searchPath: 'doc',
    transformPath: function (filePath) {
      return filePath.replace('/doc/doc/', '/doc/')
    }
  });

  return gulp.src('doc/*.html')
    .pipe(assets)
    .pipe($.if('*.css', $.postcss([
      cssnano()
    ])))
    .pipe($.if('*.js', $.uglify()))
    .pipe(assets.restore())
    .pipe($.useref())
    .pipe(gulp.dest('doc'));
});

gulp.task('default', ['useref']);