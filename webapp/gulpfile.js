var gulp = require('gulp');
var browserify = require('browserify');
var babelify = require('babelify');
var source = require('vinyl-source-stream');
var rename = require('gulp-rename');
var es = require('event-stream');
var uglify = require('gulp-uglify');
var buffer = require('vinyl-buffer');

gulp.task('transform', function () {

	return browserify({
        entries: './static/jsx/index.jsx'
    }).transform('babelify', {
        presets: ['es2015','react'],
        compact: "false",
        global: true
    })
    .bundle()
    .on('error', function(err){
        console.log(err.stack);
        this.emit('end');
    })
    .pipe(source('index.jsx'))
    .pipe(buffer())
    .pipe(uglify())
    .pipe(rename({
    	extname: '.js'
    }))
    .pipe(gulp.dest('./static/js'));
});
gulp.task('watch', ['transform'], function () {
    gulp.watch('./static/jsx/*', ['transform']);
});
gulp.task('default', ['watch']);