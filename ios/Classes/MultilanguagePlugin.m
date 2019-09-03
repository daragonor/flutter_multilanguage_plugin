#import "MultilanguagePlugin.h"
#import <multilanguage_plugin/multilanguage_plugin-Swift.h>

@implementation MultilanguagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMultilanguagePlugin registerWithRegistrar:registrar];
}
@end
