#import "L10nPlugin.h"
#if __has_include(<l10n/l10n-Swift.h>)
#import <l10n/l10n-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "l10n-Swift.h"
#endif

@implementation L10nPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftL10nPlugin registerWithRegistrar:registrar];
}
@end
