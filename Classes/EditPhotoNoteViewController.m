//
//  EditNote.m
//  MemoPad
//
//  Created by travis sein on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditPhotoNoteViewController.h"


@implementation EditPhotoNoteViewController

@synthesize noteBody, noteTitle, photoNote, takePhotoButton, pickPhotoButton;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.noteTitle setBackgroundColor:[UIColor colorWithRed:.992 green:.941 blue:.639 alpha:1.00]];
	[self.noteTitle setFont:[UIFont fontWithName:@"Marker Felt" size:36]];
	[self.noteTitle setTextColor:[UIColor colorWithRed:.192 green:.192 blue:.192 alpha:1.00]];
	[self.view setBackgroundColor:[UIColor colorWithRed:.992 green:.941 blue:.639 alpha:1.00]];
	
	self.noteTitle.text = [photoNote title];
	if([photoNote body] != nil)
	{
		self.noteBody.image = [photoNote body];
	}else{
		self.noteBody.image = [UIImage imageNamed:@"camera_icon.gif"];
	}
}

-(IBAction) getPhoto:(id) sender {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	
	if((UIButton *) sender == pickPhotoButton) {
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	} else {
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
	
	[self presentModalViewController:picker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissModalViewControllerAnimated:YES];
	noteBody.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void) viewWillAppear:(BOOL)animated
{
	self.noteTitle.text = [photoNote title];
	if([photoNote body] != nil)
	{
		self.noteBody.image = [photoNote body];
	}else{
		self.noteBody.image = [UIImage imageNamed:@"camera_icon.gif"];
	}
}

- (void) viewWillDisappear:(BOOL)animated
{
	[photoNote setTitle: noteTitle.text];
	[photoNote setBody: noteBody.image];
	[UIView beginAnimations:@"animation" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO]; 
	[UIView commitAnimations];
}

- (void)viewDidUnload {
    [photoNote setTitle: noteTitle.text];
	[photoNote setBody: noteBody.image];
	[super viewDidUnload];    
}


- (void)dealloc {
    [super dealloc];
}


@end
