//
//  RootViewController.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditTextNoteViewController.h"
#import "EditPhotoNoteViewController.h"
#import "EditAudioNoteViewController.h"
#import "Category.h"
#import "Note.h"
#import "TextNote.h"
#import "PhotoNote.h"
#import "AudioNote.h"

@interface CategoryViewController : UITableViewController <UIActionSheetDelegate> {
	Category *category;
	Note *tempNote;
	EditTextNoteViewController *editTextNote;
	EditPhotoNoteViewController *editPhotoNote;
	EditAudioNoteViewController *editAudioNote;
	//IBOutlet UITextField *noteTitle, *noteBody;
}

@property (nonatomic, retain) Category *category;
@property (nonatomic, retain) EditTextNoteViewController *editTextNote;
@property (nonatomic, retain) EditPhotoNoteViewController *editPhotoNote;
@property (nonatomic, retain) EditAudioNoteViewController *editAudioNote;

-(void)addNote;
-(IBAction)showActionSheet:(id)sender;

@end
