//
//  EditNote.m
//  MemoPad
//
//  Created by travis sein on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditNote.h"


@implementation EditNote

@synthesize noteBody, noteTitle, textNote;

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
	
	[self.view setBackgroundColor:[UIColor colorWithRed:.992 green:.886 blue:.286 alpha:.50]];
	
	self.noteTitle.text = [textNote title];
	self.noteBody.text = [textNote body];
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
	self.noteTitle.text = [textNote title];
	self.noteBody.text = [textNote body];
}

- (void) viewWillDisappear:(BOOL)animated
{
	[textNote setTitle: noteTitle.text];
	[textNote setBody: noteBody.text];
}

- (void)viewDidUnload {
    [textNote setTitle: noteTitle.text];
	[textNote setBody: noteBody.text];
	[super viewDidUnload];
    
}


- (void)dealloc {
    [super dealloc];
}


@end
