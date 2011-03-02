//
//  RootViewController.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotesList.h"
#import "Note.h"
#import "TextNote.h"

@interface RootViewController : UITableViewController {
	NotesList *notesList;
	Note *tempNote;
	IBOutlet UIViewController *addScreen;
	IBOutlet UITextField *noteTitle, *noteBody;	
}

-(void)addNote;
-(IBAction)addItemButtonClicked: (id) sender;

@end
