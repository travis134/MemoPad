//
//  RootViewController.m
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryListViewController.h"
#import "CategoryViewController.h"


@implementation CategoryListViewController


@synthesize categoryViewController, categoryTitleTextField;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	categoryList = [[CategoryList alloc] init];
	self.title = @"Categories";
	
	UIBarButtonItem *addButton = [[[UIBarButtonItem alloc]
								   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
								   target:self
								   action:@selector(addCategory)] autorelease];
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	NSArray *buttons = [NSArray arrayWithObjects: addButton, nil];
	
	self.toolbarItems=buttons;
	
	[[self navigationController] setToolbarHidden:NO animated:NO];
	
	[self.tableView setAllowsSelectionDuringEditing:YES];
	
	//Set background and seperator colors
	[self.tableView setSeparatorColor:[UIColor colorWithRed:.71 green:.62 blue:.145 alpha:1.00]];
	[self.tableView setBackgroundColor:[UIColor colorWithRed:.992 green:.941 blue:.639 alpha:1.00]];

	[self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:.353 green:.243 blue:.180 alpha:1.00]];
	[self.navigationController.toolbar setTintColor:[UIColor colorWithRed:.353 green:.243 blue:.180 alpha:1.00]];
	
	self.categoryViewController = [[CategoryViewController alloc] init];
	
	self.categoryTitleTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
	[categoryTitleTextField setBackgroundColor:[UIColor whiteColor]];
	
}

- (void)addCategory
{
	categoryTitleTextField.text = @"";
	UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Category Title" message:@"_" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	myAlertView.tag = 0;
	[myAlertView addSubview:categoryTitleTextField];
	[myAlertView show];
	[myAlertView release];
	[self.tableView reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(alertView.tag == 0)
	{
		if(buttonIndex == 0)
		{
			
		}
		else if(buttonIndex == 1)
		{
			if(categoryTitleTextField.text != @"")
			{
				[categoryList addNewCategory];
				[[categoryList categoryAtIndex:([categoryList count]-1)] setTitle:categoryTitleTextField.text];
				[self.tableView reloadData];
			}
		}
	}
	else if(alertView.tag == 1)
	{
		if(buttonIndex == 0)
		{
			
		}
		else if(buttonIndex == 1)
		{
			if(categoryTitleTextField.text != @"")
			{
				[[categoryList categoryAtIndex:currentIndex] setTitle:categoryTitleTextField.text];
				[self.tableView reloadData];
			}
		}
	}
}

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [categoryList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"%@", [[categoryList categoryAtIndex:[indexPath row]] title]];
	
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
		[categoryList removeCategoryAtIndex:[indexPath row]];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	[categoryList moveCategoryAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
}


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if([self.tableView isEditing])
	{
		currentIndex = indexPath.row;
		categoryTitleTextField.text = [[categoryList categoryAtIndex:[indexPath row]] title];
		UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Category Name" message:@"_" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
		myAlertView.tag = 1;
		[myAlertView addSubview:categoryTitleTextField];
		[myAlertView show];
		[myAlertView release];
		[self.tableView reloadData];
	}else{
		self.categoryViewController.title = [[categoryList categoryAtIndex:[indexPath row]] title];
		[self.categoryViewController setCategory: [categoryList categoryAtIndex:[indexPath row]]];
		[self.navigationController pushViewController:self.categoryViewController animated:YES];
		
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

