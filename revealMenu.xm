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

BOOL isNotRevealMenuTweak;
%hook SBIconView

// - (int)location {
- (id)initWithContentType:(unsigned long long)arg1 {
	UISwipeGestureRecognizer *swipeGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(revealMenuSwiped:)];
	[swipeGest setDirection:4];
 	[self addGestureRecognizer:swipeGest];
    return %orig;
}

%new
- (void)revealMenuSwiped:(id)sender {
	isNotRevealMenuTweak = YES;
	[self _handleSecondHalfLongPressTimer:nil];
	isNotRevealMenuTweak = NO;
}

- (void)_handleSecondHalfLongPressTimer:(id)arg1 {
	if (isNotRevealMenuTweak) {
		%orig;
	} else {
		SBApplication *app = [[%c(SBApplicationController) sharedInstance] applicationWithBundleIdentifier:self.icon.applicationBundleID];
		SBApplicationIcon *appIcon =[[%c(SBApplicationIcon) alloc] initWithApplication:app];
		SBIconView *iconView = [[%c(SBIconViewMap) homescreenMap] mappedIconViewForIcon:appIcon];
		[revealMenuHelper presentMenuFromIcon:iconView];
		[self setHighlighted:NO];
		[self cancelLongPressTimer];
	}
}
%end

%end


%ctor {
	@autoreleasepool {
		%init(main);
	}
}
