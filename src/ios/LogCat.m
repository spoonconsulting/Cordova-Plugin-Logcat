#import "LogCat.h"
#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>
@implementation LogCat

- (void)sendLogs:(CDVInvokedUrlCommand*)command {

    NSArray *allPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [allPaths objectAtIndex:0];
    NSString *pathForLog = [documentsDirectory stringByAppendingPathComponent:@"logcat.txt"];
    
    freopen([pathForLog cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
    CDVPluginResult * pluginResult =[CDVPluginResult resultWithStatus : CDVCommandStatus_OK messageAsString : pathForLog];
    [self.commandDelegate sendPluginResult : pluginResult callbackId :command.callbackId];
  }
@end
