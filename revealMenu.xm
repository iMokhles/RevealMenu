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
BOOL isLaunching;
%hook SBIconView

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

- (void)_handleFirstHalfLongPressTimer:(id)arg1 {
	[self cancelLongPressTimer];
	NSTimer *longPressTimer = MSHookIvar<NSTimer *>(self, "_longPressTimer");
	longPressTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                                           selector:@selector(_handleSecondHalfLongPressTimer:) userInfo:nil repeats:NO];                                                    
}

- (void)_handleSecondHalfLongPressTimer:(NSTimer *)arg1 {
	[self setHighlighted:NO];
	isLaunching = YES;
	if (isNotRevealMenuTweak) {
		isLaunching = NO;
		%orig;
	} else {
		if (!self.isEditing) {
			isLaunching = NO;
			SBApplication *app = [[%c(SBApplicationController) sharedInstance] applicationWithBundleIdentifier:self.icon.applicationBundleID];
			SBApplicationIcon *appIcon =[[%c(SBApplicationIcon) alloc] initWithApplication:app];
			SBIconView *iconView = [[%c(SBIconViewMap) homescreenMap] mappedIconViewForIcon:appIcon];
			[revealMenuHelper presentMenuFromIcon:iconView];
		} else {
			%orig;
		}
		
	}
}
%end

%hook SBApplicationIcon

-(BOOL)launchEnabled{
    if (isLaunching){
        return NO;
    }
    else {
        return %orig;
    }
}
%end

%end


%ctor {
	@autoreleasepool {
		%init(main);
	}
}
