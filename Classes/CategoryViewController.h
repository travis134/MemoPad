//
//  RootViewController.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditNote.h"
#import "Category.h"
#import "Note.h"
#import "TextNote.h"

@interface CategoryViewController : UITableViewController {
	Category *category;
	Note *tempNote;
	IBOutlet EditNote *editNote;
	IBOutlet UITextField *noteTitle, *noteBody;	
}

@property (nonatomic, retain) Category *category;
@property (nonatomic, retain) EditNote *editNote;

-(void)addNote;
-(IBAction)addItemButtonClicked: (id) sender;

@end
