//
//  EditNote.h
//  MemoPad
//
//  Created by travis sein on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "PhotoNote.h"

@interface EditPhotoNoteViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	IBOutlet UITextView *noteTitle;	
	IBOutlet UIImageView *noteBody;	
	UIButton *takePhotoButton;
	UIButton *pickPhotoButton;
	PhotoNote *photoNote;
}

@property (nonatomic, retain) IBOutlet UITextView *noteTitle;
@property (nonatomic, retain) IBOutlet UIImageView *noteBody;
@property (nonatomic, retain) PhotoNote *photoNote;
@property (nonatomic, retain) IBOutlet UIButton *takePhotoButton;
@property (nonatomic, retain) IBOutlet UIButton *pickPhotoButton;

-(IBAction) getPhoto:(id) sender;

@end
