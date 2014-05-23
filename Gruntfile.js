/* jshint laxcomma:true */
/* global module, require */
module.exports = function(grunt){

	'use strict';

	require('time-grunt')(grunt);

	grunt.initConfig({
		less: {
			css: {
				options: {
					compress: true
					,report: 'min'
					,paths: ['common/less']
				}
				,files: {
					'assets/css/bundle.min.css': 'assets/less/bundle.less'
				}
			}
		}
		,watch: {
			styles: {
				files: ['assets/less/*.less']
				,tasks: ['less:css']
			}
			,grunt: {
				files: ['Gruntfile.js']
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-less');
	grunt.registerTask('default', ['watch']);

};
