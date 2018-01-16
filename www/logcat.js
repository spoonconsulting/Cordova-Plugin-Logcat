cordova.define("cordova-plugin-logcat.LogCat", function(require, exports, module) {
    module.exports = {
        getLogPath: function(successCB, failureCB) {
            cordova.exec(successCB, failureCB, "LogCat", "getLogPath", []);
        },
        logToFile: function(successCB, failureCB) {
            cordova.exec(successCB, failureCB, "LogCat", "logToFile", []);
        },
    };

});