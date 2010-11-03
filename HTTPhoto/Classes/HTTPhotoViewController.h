//
//  HTTPhotoViewController.h
//  HTTPhoto
//
//  Created by Abdelilah Sawab on 03/11/10.
// https://github.com/abdelilah
//

#import <UIKit/UIKit.h>

@interface HTTPhotoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
	IBOutlet UIImageView *BgImage;
}

@property (nonatomic, retain) IBOutlet UIImageView *BgImage;

- (IBAction) btnClicked:(id)sender;

@end

