/* global require */
'use strict';

require.config({
    paths: {
        jquery: '../bower_components/jquery/jquery',
        underscore: '../bower_components/underscore-amd/underscore',
        backbone: '../bower_components/backbone-amd/backbone',
        backboneLocalstorage: '../bower_components/backbone.localStorage/backbone.localStorage',
        text: '../bower_components/requirejs-text/text',
        d3: '../bower_components/d3/d3',
        arcClock: './arc-clock',
        lorenz: './lorenz',
        transitions: './transitions'
    },
    shim: {
        underscore: {
            exports: '_'
        },
        backbone: {
            deps: ['jquery', 'underscore'],
            exports: 'Backbone'
        },
        backboneLocalstorage: {
            deps: ['backbone'],
            exports: 'Store'
        },
        d3: {
            exports: 'd3'
        }
    }
});

require([
    'jquery',
    'underscore',
    'backbone',
    'views/app',
    'routers/router',
    'arc-clock',
    'lorenz',
    'transitions'], function ($, _, Backbone, AppView, Workspace, arcClock, lorenz, transitions) {
    // use app here
    new Workspace();
    Backbone.history.start();

    new AppView();
});