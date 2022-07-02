/*eslint-env node */

var gulp = require('gulp');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var browserSync = require('browser-sync').create();
var eslint = require('gulp-eslint');
var jasmine = require('gulp-jasmine-phantom');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
// var babel = require('gulp-babel');
var sourcemaps = require('gulp-sourcemaps');
var imagemin = require('gulp-imagemin');
var pngquant = require('imagemin-pngquant');
var series = require('stream-series');
var inject = require('gulp-inject');
var ngHtml2Js = require("gulp-ng-html2js");
var minifyHtml = require("gulp-minify-html");
var CacheBuster = require('gulp-cachebust');
var del = require('del');
var sequence = require('run-sequence');
var userConfig = require('./build.config.js');
/////////////////////////////
//       build tasks       //
/////////////////////////////

gulp.task('copy-bower-components-assets-build', function() {
	return gulp.src(userConfig.bower_components.assets, { base : '.' })
		.pipe(gulp.dest('build'));
});

gulp.task('styles-build', function() {
	return gulp.src('src/sass/**/main.scss')
		.pipe(sass({
			outputStyle: 'compressed'
		}).on('error', sass.logError))
		.pipe(autoprefixer({
			browsers: ['last 2 versions']
		}))
		.pipe(gulp.dest('build/css'))
		.pipe(browserSync.stream());
});

gulp.task('partials-build', function () {
	return gulp.src('src/app/**/*.tpl.html')
		.pipe(minifyHtml({
			empty: true,
			spare: true,
			quotes: true
		}))
		.pipe(ngHtml2Js({
			moduleName: "templates-app",
			prefix: "app/"
		}))
		.pipe(concat("partials.min.js"))	
		.pipe(gulp.dest("build/js"));
});

gulp.task('copy-app-assets-build', function() {
	return gulp.src('src/assets/**')
		.pipe(gulp.dest('build/assets'));
});

gulp.task('copy-app-js-build', function() {
	return gulp.src('src/**/*.js')
		.pipe(gulp.dest('build'));
});

gulp.task('copy-images-build', function() {
	return gulp.src('src/img/**/*')
		.pipe(gulp.dest('build/img'));
});

gulp.task('copy-viewer-build', function() {
	return gulp.src('src/viewer/**/*')
		.pipe(gulp.dest('build/viewer'));
});

gulp.task('index-build', function () {
	var bowerComponentsBuildStream = gulp.src((userConfig.bower_components.js).concat(userConfig.bower_components.css), { base : '.' })
  .pipe(gulp.dest('build'));

	var partialsBuildStream = gulp.src('src/app/**/*.tpl.html')
		.pipe(minifyHtml({
			empty: true,
			spare: true,
			quotes: true
		}))
		.pipe(ngHtml2Js({
			moduleName: "templates-app",
			prefix: "app/"
		}))
		.pipe(concat("partials.min.js"))	
		.pipe(gulp.dest("build/js"));

	var appJSBuildStream = gulp.src('src/**/*.js')
	  .pipe(gulp.dest('build'));

	var appCSSDistStream =  gulp.src('src/sass/**/main.scss')
		.pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
		.pipe(autoprefixer({browsers: ['last 2 versions']}))
		.pipe(gulp.dest('build/css'))
		.pipe(browserSync.stream());
	;


  return gulp.src('src/index.html')
	  .pipe(inject(series(bowerComponentsBuildStream, partialsBuildStream, appJSBuildStream, appCSSDistStream), {relative: false, addRootSlash: false, ignorePath: '/build/'}))
	  .pipe(gulp.dest('build'));
});

gulp.task('default', [
	'copy-bower-components-assets-build',
	'styles-build',
	'copy-app-assets-build',
	'copy-images-build',
	'copy-viewer-build',
	'index-build',
	], function() {

		gulp.watch('src/sass/**/*.scss', ['styles-build']);
		gulp.watch('src/**/*.js', ['copy-app-js-build']);
		gulp.watch('src/**/*.tpl.html', ['partials-build']);
		//gulp.watch('js/**/*.js', ['lint']);
		gulp.watch('src/index.html', ['index-build']);
		gulp.watch(['./build/**/*.js', './build/index.html']).on('change', browserSync.reload);

		browserSync.init({
			server: './build'
		});
});

//////// end build tasks ////////



/////////////////////////////
//        dist tasks        //
/////////////////////////////
var cachebust = new CacheBuster();

gulp.task('clean-dist', function () {
	return del(['dist/**', '!dist'], {force:true});
  });


gulp.task('copy-bower-components-assets-dist', function() {
	return gulp.src(userConfig.bower_components.assets, { base : '.' })
		.pipe(gulp.dest('dist'));
});



gulp.task('copy-app-assets-dist', function() {
	return gulp.src('src/assets/**')
		.pipe(gulp.dest('dist/assets'));
});

gulp.task('copy-images-dist', function() {
	return gulp.src('src/img/**/*')
		.pipe(imagemin({
            progressive: true,
            use: [pngquant()]
        }))
		.pipe(gulp.dest('dist/img'));
});

gulp.task('copy-viewer-dist', function() {
	return gulp.src('src/viewer/**/*')
		.pipe(gulp.dest('dist/viewer'));
});

gulp.task('copy-web-config', function() {
	return gulp.src('web.config')
		.pipe(gulp.dest('dist'));
});

gulp.task('index-dist', function () {
	var bowerComponentsDistStream = gulp.src((userConfig.bower_components.js).concat(userConfig.bower_components.css), { base : '.' })
  .pipe(gulp.dest('dist'));

	var partialsDistStream = gulp.src('src/app/**/*.tpl.html')
		.pipe(minifyHtml({
			empty: true,
			spare: true,
			quotes: true
		}))
		.pipe(ngHtml2Js({
			moduleName: "templates-app",
			prefix: "app/"
		}))
	//	.pipe(sourcemaps.init())
		.pipe(concat("partials.min.js"))
		.pipe(uglify())
	//	.pipe(sourcemaps.write('.'/*,{includeContent: false, sourceRoot: 'src'}*/))
		.pipe(cachebust.resources())
		.pipe(gulp.dest("dist/js"));

	var appJSDistStream = gulp.src('src/**/*.js')
	  //.pipe(sourcemaps.init())
	  .pipe(concat('app.min.js'))
	  .pipe(uglify())
	  .pipe(cachebust.resources())
	  //.pipe(sourcemaps.write('.'/*,{includeContent: false, sourceRoot: 'src'}*/))
	  .pipe(gulp.dest('dist/js'));

	var appCSSDistStream =  gulp.src('src/sass/**/main.scss')
		.pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
		.pipe(cachebust.resources())
		.pipe(gulp.dest('dist/css'))
	;

	
  return gulp.src('src/index.html')
  	.pipe(cachebust.references())
	.pipe(inject(series(bowerComponentsDistStream, partialsDistStream, appJSDistStream, appCSSDistStream), {relative: false, addRootSlash: false, ignorePath: '/dist/'}))
	.pipe(gulp.dest('dist'));
});

gulp.task('do-dist', [
	'copy-bower-components-assets-dist',
	'copy-app-assets-dist',
	'copy-images-dist',
	'copy-viewer-dist',
	'copy-web-config',
	'index-dist',
]);


gulp.task('dist', function (done) {
    sequence('clean-dist', 'do-dist', done);
});
//////// end dist tasks ////////







gulp.task('defaultexample', ['copy-html', 'copy-images', 'styles', 'lint', 'scripts'], function() {
	gulp.watch('sass/**/*.scss', ['styles']);
	gulp.watch('js/**/*.js', ['lint']);
	gulp.watch('./index.html', ['copy-html']);
	gulp.watch('./dist/index.html').on('change', browserSync.reload);

	browserSync.init({
		server: './dist'
	});
});

gulp.task('distexample', [
	'copy-html',
	'copy-images',
	'styles',
	'lint',
	'scripts-dist'
]);

gulp.task('scripts', function() {
	return gulp.src('js/**/*.js')
		.pipe(concat('all.js'))
		.pipe(gulp.dest('dist/js'));
});

gulp.task('scripts-dist', function() {
	return gulp.src('js/**/*.js')
		// .pipe(babel())
		// .pipe(sourcemaps.init())
		.pipe(concat('all.js'))
		.pipe(uglify())
		// .pipe(sourcemaps.write())
		.pipe(gulp.dest('dist/js'));
});

gulp.task('copy-html', function() {
	return gulp.src('src/index.html')
		.pipe(gulp.dest('./build'));
});

gulp.task('copy-images', function() {
	return gulp.src('src/img/**/*')
		/*.pipe(imagemin({
            progressive: true,
            use: [pngquant()]
        }))*/
		.pipe(gulp.dest('build/img'));
});

gulp.task('styles', function() {
	return gulp.src('src/sass/**/*.scss')
		.pipe(sass({
			outputStyle: 'compressed'
		}).on('error', sass.logError))
		.pipe(autoprefixer({
			browsers: ['last 2 versions']
		}))
		.pipe(gulp.dest('build/css'))
		.pipe(browserSync.stream());
});

gulp.task('lint', function () {
	return gulp.src(['js/**/*.js'])
		// eslint() attaches the lint output to the eslint property
		// of the file object so it can be used by other modules.
		.pipe(eslint())
		// eslint.format() outputs the lint results to the console.
		// Alternatively use eslint.formatEach() (see Docs).
		.pipe(eslint.format())
		// To have the process exit with an error code (1) on
		// lint error, return the stream and pipe to failOnError last.
		.pipe(eslint.failOnError());
});

gulp.task('tests', function () {
	return gulp.src('tests/spec/extraSpec.js')
		.pipe(jasmine({
			integration: true,
			vendor: 'js/**/*.js'
		}));
});