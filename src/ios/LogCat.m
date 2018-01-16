#import "LogCat.h"
#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>
@implementation LogCat

-(NSString*) logFilePath{
    NSArray *allPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [allPaths objectAtIndex:0];
    NSString *pathForLog = [documentsDirectory stringByAppendingPathComponent:@"logcat.txt"];
    return pathForLog;
}
- (void)logToFile:(CDVInvokedUrlCommand*)command {
    NSString *pathForLog = [self logFilePath];
    freopen([pathForLog cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
}

-(void) getLogPath:(CDVInvokedUrlCommand*)command {
    NSString *pathForLog = [self logFilePath];
    CDVPluginResult * pluginResult =[CDVPluginResult resultWithStatus : CDVCommandStatus_OK messageAsString : pathForLog];
    [self.commandDelegate sendPluginResult : pluginResult callbackId :command.callbackId];
}
@end
