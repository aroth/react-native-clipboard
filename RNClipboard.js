'use strict';

var RNClipboard = require('react-native').NativeModules.RNClipboard;

var Clipboard = {
    get(callback) {
        RNClipboard.get(callback)
    },

    set(content) {
        RNClipboard.set(content);
    },
    
    setImageWithTag(tag, successCallback, errorCallback) {
        RNClipboard.setImageWithTag(tag, successCallback, errorCallback);      
    }
};

module.exports = Clipboard;