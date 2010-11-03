//
//  HTTPhotoViewController.m
//  HTTPhoto
//
//  Created by Abdelilah Sawab on 03/11/10.
//  https://github.com/abdelilah
//

#import "HTTPhotoViewController.h"

@implementation HTTPhotoViewController

@synthesize BgImage;



- (IBAction) btnClicked:(id)sender
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	[self presentModalViewController:picker animated:YES];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
	
	// Close the picker dialog and show selected image in the background
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
	self.BgImage.image = image;
	
	
	// Now preparing for photo upload
	NSString *urlString = @"http://localhost/iphone_upload/index.php"; // Destination
	NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
	
	// Create and configure request object
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
	
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	
	// Create request body
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"iphone_photo.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:imageData];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:body];
	
	// Send the request
	[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
	
	[picker release];
}



- (void)dealloc {
	[self.BgImage release];
	
    [super dealloc];
}

@end
