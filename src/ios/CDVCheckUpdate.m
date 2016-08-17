#import "CDVCheckUpdate.h"

@implementation CDVCheckUpdate

- (void)check:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
	NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
	NSString* appID = infoDictionary[@"CFBundleIdentifier"];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@", appID]];
	NSData* data = [NSData dataWithContentsOfURL:url];
	NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

	if ([lookup[@"resultCount"] integerValue] == 1){
		NSString* appStoreVersion = lookup[@"results"][0][@"version"];
		NSString* currentVersion = infoDictionary[@"CFBundleShortVersionString"];
		if (![appStoreVersion isEqualToString:currentVersion]){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(BOOL*)true];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(BOOL*)false];
        }
    } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(BOOL*)false];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
