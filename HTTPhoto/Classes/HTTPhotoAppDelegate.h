//
//  HTTPhotoAppDelegate.h
//  HTTPhoto
//
//  Created by Abdelilah Sawab on 03/11/10.
//  https://github.com/abdelilah
//

#import <UIKit/UIKit.h>

@class HTTPhotoViewController;

@interface HTTPhotoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HTTPhotoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HTTPhotoViewController *viewController;

@end

