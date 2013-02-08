//
//  DCControlsAppDelegate.h
//
//  Copyright 2011 Domestic Cat Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCControlsAppDelegate : NSObject <UIApplicationDelegate>
{
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;

@end
