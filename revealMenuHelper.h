//
//  revealMenuListController.h
//  revealMenu
//
//  Created by iMokhles on 14.10.2015.
//  Copyright (c) 2015 iMokhles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <substrate.h>

@interface SBIcon : NSObject
- (id)applicationBundleID;
@end

@interface SBIconView : UIView {
	NSTimer *_longPressTimer;
    double _longPressGrabDuration;
}
@property(retain, nonatomic) SBIcon *icon;
- (_Bool)isEditing;
- (void)setHighlighted:(_Bool)arg1;
- (void)cancelLongPressTimer;
- (void)setAllowJitter:(_Bool)arg1;
- (void)_handleSecondHalfLongPressTimer:(id)arg1;
@end

@interface SBIconModel : NSObject
- (SBIcon *)applicationIconForBundleIdentifier:(NSString *)bundleIdentifier;
@end

@interface SBIconViewMap : NSObject
+ (instancetype)homescreenMap;
- (id)mappedIconViewForIcon:(id)arg1;
@end

@interface SBLeafIcon : SBIcon
- (id)applicationBundleID;
- (id)leafIdentifier;
@end

@interface SBApplicationIcon : SBLeafIcon
- (id)initWithApplication:(id)arg1;
@end

@interface SBApplication : NSObject;
@end

@interface SBApplicationController
+(id) sharedInstance;
-(SBApplication*) applicationWithBundleIdentifier:(NSString*)identifier;
@end

@interface SBIconController : UIViewController
@property (nonatomic, readonly, strong) SBIconModel *model;
+ (instancetype)sharedInstance;
- (void)_revealMenuForIconView:(SBIconView *)iconView presentImmediately:(BOOL)presentImmediately;
- (void)scrollToIconListContainingIcon:(SBIcon *)icon animate:(BOOL)animate;
@end

@interface revealMenuHelper : NSObject

+(void)presentMenuFromIcon:(SBIconView *)icon;

@end
