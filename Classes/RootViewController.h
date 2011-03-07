//
//  RootViewController.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"
#import "Note.h"
#import "TextNote.h"

@interface RootViewController : UITableViewController {
	Category *category;
	Note *tempNote;
	IBOutlet UIViewController *addScreen;
	IBOutlet UITextField *noteTitle, *noteBody;	
}

-(void)addNote;
-(IBAction)addItemButtonClicked: (id) sender;

@end
