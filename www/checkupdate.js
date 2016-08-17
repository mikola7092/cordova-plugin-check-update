var exec = require('cordova/exec');

var checkupdate = function(callbackSuccess, callbackFailed) {
        exec(callbackSuccess, callbackFailed, "CheckUpdate", "check", []);
    };

module.exports = checkupdate;