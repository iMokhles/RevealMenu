#line 1 "revealMenu.x"








#import "revealMenuHelper.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#include <logos/logos.h>
#include <objc/message.h>
@class SBIconViewMap; @class SBIconView; @class SBApplicationController; @class SBApplicationIcon; 

static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$SBApplicationController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBApplicationController"); } return _klass; }static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$SBApplicationIcon(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBApplicationIcon"); } return _klass; }static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$SBIconViewMap(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBIconViewMap"); } return _klass; }
#line 12 "revealMenu.x"
static Class _logos_superclass$main$SBIconView; static int (*_logos_orig$main$SBIconView$location)(SBIconView*, SEL);static void (*_logos_orig$main$SBIconView$touchesEnded$withEvent$)(SBIconView*, SEL, id, id);



static int _logos_super$main$SBIconView$location(SBIconView* self, SEL _cmd) {return ((int (*)(SBIconView*, SEL))class_getMethodImplementation(_logos_superclass$main$SBIconView, @selector(location)))(self, _cmd);}static int _logos_method$main$SBIconView$location(SBIconView* self, SEL _cmd) {
	
	
 
    return _logos_orig$main$SBIconView$location(self, _cmd);
}





	

static void _logos_super$main$SBIconView$touchesEnded$withEvent$(SBIconView* self, SEL _cmd, id arg1, id arg2) {return ((void (*)(SBIconView*, SEL, id, id))class_getMethodImplementation(_logos_superclass$main$SBIconView, @selector(touchesEnded:withEvent:)))(self, _cmd, arg1, arg2);}static void _logos_method$main$SBIconView$touchesEnded$withEvent$(SBIconView* self, SEL _cmd, id arg1, id arg2) {
	double longPressGrabDuration = (double)[self valueForKey:@"_longPressGrabDuration"];
	if (longPressGrabDuration > 0.4) {
		SBApplication *app = [[_logos_static_class_lookup$SBApplicationController() sharedInstance] applicationWithBundleIdentifier:self.icon.applicationBundleID];
		SBApplicationIcon *appIcon =[[_logos_static_class_lookup$SBApplicationIcon() alloc] initWithApplication:app];
		SBIconView *iconView = [[_logos_static_class_lookup$SBIconViewMap() homescreenMap] mappedIconViewForIcon:appIcon];
		[revealMenuHelper presentMenuFromIcon:iconView];
	} else {
		_logos_orig$main$SBIconView$touchesEnded$withEvent$(self, _cmd, arg1, arg2);
	}
	NSLog(@"***************** \n\n\n\n\n\n\n %d", longPressGrabDuration);
}





static __attribute__((constructor)) void _logosLocalCtor_9e60c2ca() {
	@autoreleasepool {
		{Class _logos_class$main$SBIconView = objc_getClass("SBIconView"); _logos_superclass$main$SBIconView = class_getSuperclass(_logos_class$main$SBIconView); { Class _class = _logos_class$main$SBIconView;Method _method = class_getInstanceMethod(_class, @selector(location));if (_method) {_logos_orig$main$SBIconView$location = _logos_super$main$SBIconView$location;if (!class_addMethod(_class, @selector(location), (IMP)&_logos_method$main$SBIconView$location, method_getTypeEncoding(_method))) {_logos_orig$main$SBIconView$location = (int (*)(SBIconView*, SEL))method_getImplementation(_method);_logos_orig$main$SBIconView$location = (int (*)(SBIconView*, SEL))method_setImplementation(_method, (IMP)&_logos_method$main$SBIconView$location);}}}{ Class _class = _logos_class$main$SBIconView;Method _method = class_getInstanceMethod(_class, @selector(touchesEnded:withEvent:));if (_method) {_logos_orig$main$SBIconView$touchesEnded$withEvent$ = _logos_super$main$SBIconView$touchesEnded$withEvent$;if (!class_addMethod(_class, @selector(touchesEnded:withEvent:), (IMP)&_logos_method$main$SBIconView$touchesEnded$withEvent$, method_getTypeEncoding(_method))) {_logos_orig$main$SBIconView$touchesEnded$withEvent$ = (void (*)(SBIconView*, SEL, id, id))method_getImplementation(_method);_logos_orig$main$SBIconView$touchesEnded$withEvent$ = (void (*)(SBIconView*, SEL, id, id))method_setImplementation(_method, (IMP)&_logos_method$main$SBIconView$touchesEnded$withEvent$);}}}}
	}
}
