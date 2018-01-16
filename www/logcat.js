 module.exports = {
        getLogPath: function(successCB, failureCB) {
            cordova.exec(successCB, failureCB, "LogCat", "getLogPath", []);
        },
        logToFile: function(successCB, failureCB) {
            cordova.exec(successCB, failureCB, "LogCat", "logToFile", []);
        },
 };
