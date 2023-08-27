#import <UIKit/UIKit.h>
#import <rootless.h>
#import <SparkColourPickerUtils.h>

@interface SBUILegibilityLabel : UIView
@property (nonatomic, copy, readwrite) NSString *string;
@property (nonatomic, copy, readwrite) UIColor *textColor;
@end

@interface NCNotificationListSectionRevealHintView : UIView
@property (nonatomic, strong, readwrite) SBUILegibilityLabel *revealHintTitle;
@end

BOOL enabled = NO;
NSString *labelText;
UIColor *labelColor;
BOOL hideLabelText = NO;

static void loadPrefs() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.kome1.customnooldernotifications.plist")];
	enabled = [[settings objectForKey:@"enabled"] boolValue] ? [[settings objectForKey:@"enabled"] boolValue] : NO;
    hideLabelText = [[settings objectForKey:@"hidelabeltext"] boolValue] ? [[settings objectForKey:@"hidelabeltext"] boolValue] : NO;
    labelText = [settings objectForKey:@"labeltext"];
	labelColor = [SparkColourPickerUtils colourWithString:[settings objectForKey:@"labelcolor"] withFallback:@"#ffffff"];
}

%group Tweak
%hook NCNotificationListSectionRevealHintView
- (void)layoutSubviews {
    %orig;
    if (hideLabelText) {
        self.hidden = YES;
        return;
    }
    if (labelText) {
        self.revealHintTitle.string = labelText;
    }
    if (labelColor) {
        self.revealHintTitle.textColor = labelColor;
    }
}
%end
%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.kome1.customnooldernotifications/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	if (enabled) {
		%init(Tweak);
	}
}