//
//  revealMenu.x
//  revealMenu
//
//  Created by iMokhles on 14.10.2015.
//  Copyright (c) 2015 iMokhles. All rights reserved.
//

#import "revealMenuHelper.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

%group main
%hook SBIconView

- (id)initWithContentType:(unsigned long long)arg1 {

	SBIconController *sbIconC = [objc_getClass("SBIconController") sharedInstance];
	UILongPressGestureRecognizer *shortcutMenuPeekGesture = MSHookIvar<UILongPressGestureRecognizer *>(self, "_shortcutMenuPeekGesture");
	shortcutMenuPeekGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:sbIconC action:@selector(_handleShortcutMenuPeek:)];
 	[self addGestureRecognizer:shortcutMenuPeekGesture];
 	// add swipe-up alternative for those weren't able to get the longpress to edit to work
 	UISwipeGestureRecognizer *swipeGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(revealMenuSwiped:)];
	[swipeGest setDirection:4];
 	[self addGestureRecognizer:swipeGest];
    return %orig;
}
%new
- (void)revealMenuSwiped:(id)arg1 {
	[self _handleSecondHalfLongPressTimer:nil];
}
- (void)_updateJitter {

	// in case any error :)
	SBIconController *sbIconC = [objc_getClass("SBIconController") sharedInstance];
	[sbIconC _dismissShortcutMenuAnimated:YES completionHandler:^{

	}];
	%orig;
}
%end

%hook SBIconController
- (void)_revealMenuForIconView:(id)arg1 presentImmediately:(_Bool)arg2 {
	%orig(arg1, YES);
}
%end

// add support of Peek and Pop
// something missing here ;)
%hook UIScreen
- (int)_forceTouchCapability {
	return 1;
}
%end
%hook UITraitCollection
- (int)forceTouchCapability {
	return 1;
}
%end
%hook UIDevice
- (BOOL)_supportsForceTouch {
	return YES;
}
- (BOOL)_supportsHapticFeedback {
	return YES;
}
%end
%end


%ctor {
	@autoreleasepool {
		%init(main);
	}
}
