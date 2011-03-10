//
//  EditNote.h
//  MemoPad
//
//  Created by travis sein on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "TextNote.h"

@interface EditTextNoteViewController : UIViewController {
	IBOutlet UITextField *noteTitle;	
	IBOutlet UITextView *noteBody;	
	TextNote *textNote;
}

@property (nonatomic, retain) IBOutlet UITextField *noteTitle;
@property (nonatomic, retain) IBOutlet UITextView *noteBody;
@property (nonatomic, retain) TextNote *textNote;

@end
