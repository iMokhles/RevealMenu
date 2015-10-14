//
//  revealMenuListController.m
//  revealMenu
//
//  Created by iMokhles on 14.10.2015.
//  Copyright (c) 2015 iMokhles. All rights reserved.
//

#import "revealMenuHelper.h"

@implementation revealMenuHelper

// special thanks to Conradev : https://github.com/DeskConnect/SBShortcutMenuSimulator/blob/master/SBShortcutMenuListener.m
+(void)presentMenuFromIcon:(SBIconView *)icon {
	SBIconController *sbIconC = [objc_getClass("SBIconController") sharedInstance];
	if (!icon.isEditing) {
		[sbIconC _revealMenuForIconView:icon presentImmediately:YES];
	}
}

@end
