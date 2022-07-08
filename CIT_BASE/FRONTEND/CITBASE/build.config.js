/**
 * This file/module contains all configuration for the build process.
 */
module.exports = {
  bower_components: {
    js: [
      'bower_components/jquery/dist/jquery.min.js',
      'bower_components/bootstrap/dist/js/bootstrap.min.js',
      'bower_components/angular/angular.min.js',
      'bower_components/angular-sanitize/angular-sanitize.min.js',
      'bower_components/angular-i18n/angular-locale_es-gt.js',
      'bower_components/angular-touch/angular-touch.min.js',
      'bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js',
      'bower_components/angular-ui-router/release/angular-ui-router.min.js',
      'bower_components/angular-ui-grid/ui-grid.min.js',
      'bower_components/ui-select/dist/select.min.js',
      'bower_components/angular-toastr/dist/angular-toastr.tpls.min.js',
      'bower_components/angular-loading-bar/build/loading-bar.min.js',
      'bower_components/angular-local-storage/dist/angular-local-storage.min.js',
      'bower_components/ng-dialog/js/ngDialog.min.js',
      'bower_components/moment/min/moment-with-locales.min.js',
      'bower_components/pdfmake/build/pdfmake.min.js',
      'bower_components/pdfmake/build/vfs_fonts.js',
      'bower_components/fastclick/lib/fastclick.js',
      'bower_components/ckeditor/ckeditor.js',
      'bower_components/bootstrap-sweetalert/dist/sweetalert.min.js',
      'bower_components/SparkMD5/spark-md5.min.js',
      'bower_components/ng-table/dist/ng-table.min.js',
      'bower_components/jasny-bootstrap/js/fileinput.js',
      'bower_components/Waves/dist/waves.min.js',
      'bower_components/angular-smart-table/dist/smart-table.min.js',
      'bower_components/html2canvas/build/html2canvas.min.js',
      'bower_components/jspdf/dist/jspdf.min.js',
      'bower_components/jspdf-autotable/dist/jspdf.plugin.autotable.src.js',
      'bower_components/angular-ui-mask/dist/mask.min.js',
      'bower_components/angular-base64/angular-base64.js',
      'bower_components/JsBarcode/dist/JsBarcode.all.min.js',
      'bower_components/chart.js/dist/Chart.bundle.min.js',
      'bower_components/angular-chart.js/dist/angular-chart.min.js',
      'bower_components/ng-file-upload-shim/ng-file-upload-shim.min.js',
      'bower_components/ng-file-upload/ng-file-upload.min.js',
      'bower_components/angular-swipe/dist/angular-swipe.min.js',
      'bower_components/angular-carousel-3d/dist/carousel-3d.min.js',
      'bower_components/angular-tree-control/angular-tree-control.js',
      'bower_components/angular-scroll/angular-scroll.min.js', 
      'bower_components/bootstrap-ui-datetime-picker/dist/datetime-picker.min.js',
      'bower_components/angular-md5/angular-md5.min.js',


      'bower_components/angular-bootstrap-calendar/dist/js/angular-bootstrap-calendar-tpls.min.js',

      'bower_components/cryptojslib/rollups/pbkdf2.js',
      'bower_components/cryptojslib/rollups/aes.js',
      'bower_components/cryptojslib/rollups/md5.js',
      'bower_components/cryptojslib/rollups/sha256.js',
      'bower_components/cryptojslib/rollups/sha1.js',

      /* se hicieron cambios a esta libreria por lo que no se incluye desde aqui sino en la carpeta js
      'bower_components/AdminLTE/dist/js/app.js',
      'bower_components/angular-turnjs/dist/turn.min.js',
      'bower_components/ng-magnify/src/js/ng-magnify.js',
       */
      'bower_components/oj/ng-magnify.js',
      'bower_components/oj/turn.min.js',
      'bower_components/oj/zoom.min.js',
      'bower_components/oj/mdo-angular-cryptography-oj.js'
     // 'bower_components/oj/webOffice.js'

    
    
      
    ],
    css: [
      'bower_components/bootstrap/dist/css/bootstrap.min.css',

      'bower_components_custom/oj/fonts.googleapis.com.css',
      'bower_components_custom/oj/AdminLTE.min.css',
      
      'bower_components/AdminLTE/dist/css/skins/skin-blue.min.css',
      'bower_components/AdminLTE/dist/css/skins/skin-blue-light.min.css',
      'bower_components/animate.css/animate.min.css',
      'bower_components/font-awesome/css/font-awesome.min.css',
      'bower_components/Ionicons/css/ionicons.min.css',
      'bower_components/angular-ui-grid/ui-grid.min.css',
      'bower_components/angular-toastr/dist/angular-toastr.min.css',
      'bower_components/angular-loading-bar/build/loading-bar.min.css',
      'bower_components/ui-select/dist/select.min.css',
      'bower_components/ng-dialog/css/ngDialog.min.css',
      'bower_components/angular-bootstrap-calendar/dist/css/angular-bootstrap-calendar.min.css',
      'bower_components/bootstrap-sweetalert/dist/sweetalert.css',
      'bower_components/ng-table/dist/ng-table.min.css',
      'bower_components/jasny-bootstrap/dist/css/jasny-bootstrap.min.css',
      'bower_components/Waves/dist/waves.min.css',
      'bower_components/angular-carousel-3d/dist/carousel-3d.min.css',
      'bower_components/angular-tree-control/css/tree-control.css',
      'bower_components/angular-tree-control/css/tree-control-attribute.css',
      'bower_components/angular-tree-control/images/*',
      'bower_components/ng-magnify/src/css/ng-magnify.css',
      'node_modules/angular-bootstrap-datetimepicker/src/css/datetimepicker.css'

    ],
    assets: [
      'bower_components/angular-ui-grid/fonts/ui-grid.woff',
      'bower_components/angular-ui-grid/fonts/ui-grid.ttf',
      'bower_components_custom/oj/6xKydSBYKcSV-LCoeQqfX1RYOo3ik4zwlxdu.woff2',
      'bower_components_custom/oj/6xKydSBYKcSV-LCoeQqfX1RYOo3ig4vwlxdu.woff2',
      'bower_components_custom/oj/6xKydSBYKcSV-LCoeQqfX1RYOo3i54rwlxdu.woff2',
      'bower_components_custom/oj/6xKwdSBYKcSV-LCoeQqfX1RYOo3qPZZMkids18Q.woff2',
      'bower_components_custom/oj/6xKwdSBYKcSV-LCoeQqfX1RYOo3qPZY4lCds18Q.woff2',
      'bower_components_custom/oj/6xK3dSBYKcSV-LCoeQqfX1RYOo3qOK7l.woff2',
      'bower_components_custom/oj/6xK1dSBYKcSV-LCoeQqfX1RYOo3qPZ7nsDI.woff2',
      'bower_components/bootstrap/dist/fonts/*',
      'bower_components/font-awesome/fonts/*',
      'bower_components/ckeditor/skins/**/*.png',
      'bower_components/ckeditor/plugins/**/*.png',
      'bower_components/ckeditor/plugins/**/*.gif',
      'bower_components/ckeditor/config.js',
      'bower_components/ckeditor/lang/es.js',
      'bower_components/ckeditor/styles.js',
      'bower_components/ckeditor/plugins/**/*.js',
      'bower_components/ckeditor/contents.css',
      'bower_components/ckeditor/skins/moono/*.css',
      'bower_components/ckeditor/plugins/**/*.css'
    ]
  },
};