//
//  RootViewController.m
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryViewController.h"


@implementation CategoryViewController

@synthesize category, editTextNote, editPhotoNote, editAudioNote, quickNote, noteType;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	//category = [[Category alloc] init];
	self.title = [category title];
	
	UIBarButtonItem *addButton = [[[UIBarButtonItem alloc]
								   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
								   target:self
								   action:@selector(addNote)] autorelease];
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	NSArray *buttons = [NSArray arrayWithObjects: addButton, nil];
	
	self.toolbarItems=buttons;
	
	[[self navigationController] setToolbarHidden:NO animated:NO];
	
	[self.tableView setAllowsSelectionDuringEditing:YES];
	
	//Set background and seperator colors
	[self.tableView setSeparatorColor:[UIColor colorWithRed:.71 green:.62 blue:.145 alpha:1.00]];
	
	[self.tableView setBackgroundColor:[UIColor colorWithRed:.992 green:.941 blue:.639 alpha:1.00]];

	self.editTextNote = [[EditTextNoteViewController alloc] init];
	self.editPhotoNote = [[EditPhotoNoteViewController alloc] init];
	self.editAudioNote = [[EditAudioNoteViewController alloc] init];
}

-(IBAction)showActionSheet:(id)sender
{
	UIActionSheet *popupNoteType = [[UIActionSheet alloc] initWithTitle:@"Note Type" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Text Note", @"Photo Note", @"Audio Note", nil];
    popupNoteType.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupNoteType showInView:self.view];
    [popupNoteType release];
	
}

-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
		if(buttonIndex == 0)
		{
			[category addNewTextNote];
			[self.tableView reloadData];
			[self.editTextNote setTextNote: (TextNote*) [category noteAtIndex:([category count]-1)]];
			[UIView beginAnimations:@"animation" context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
			[self.navigationController pushViewController:self.editTextNote animated:NO];
			[UIView commitAnimations];
		}else if(buttonIndex == 1){
			[category addNewPhotoNote];
			[self.tableView reloadData];
			[self.editPhotoNote setPhotoNote: (PhotoNote*) [category noteAtIndex:([category count]-1)]];
			[UIView beginAnimations:@"animation" context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
			[self.navigationController pushViewController:self.editPhotoNote animated:NO];
			[UIView commitAnimations];
		}else if(buttonIndex == 2){
			[category addNewAudioNote];
			[self.tableView reloadData];
			[self.editAudioNote setAudioNote: (AudioNote*) [category noteAtIndex:([category count]-1)]];
			[UIView beginAnimations:@"animation" context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
			[self.navigationController pushViewController:self.editAudioNote animated:NO];
			[UIView commitAnimations];
		}
}

- (void)addNote
{
	[self showActionSheet:nil];
}

-(void)quickNote:(NoteType)inputNoteType
{
	[self setNoteType:inputNoteType];
	[self setQuickNote:YES];
}


- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
	if(self.quickNote)
	{
		if(self.noteType == TextNoteType)
		{
			[self setQuickNote:NO];
			[category addNewTextNote];
			[self.tableView reloadData];
			[self.editTextNote setTextNote: (TextNote*) [category noteAtIndex:([category count]-1)]];
			[UIView beginAnimations:@"animation" context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
			[self.navigationController pushViewController:self.editTextNote animated:NO];
			[UIView commitAnimations];
		}else if(self.noteType == PhotoNoteType){
			[self setQuickNote:NO];
			[category addNewPhotoNote];
			[self.tableView reloadData];
			[self.editPhotoNote setPhotoNote: (PhotoNote*) [category noteAtIndex:([category count]-1)]];
			[UIView beginAnimations:@"animation" context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
			[self.navigationController pushViewController:self.editPhotoNote animated:NO];
			[UIView commitAnimations];
		}else if(self.noteType == AudioNoteType){
			[self setQuickNote:NO];
			[category addNewAudioNote];
			[self.tableView reloadData];
			[self.editAudioNote setAudioNote: (AudioNote*) [category noteAtIndex:([category count]-1)]];
			[UIView beginAnimations:@"animation" context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
			[self.navigationController pushViewController:self.editAudioNote animated:NO];
			[UIView commitAnimations];
		}
	}
    [super viewDidAppear:animated];
}

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
    return [category count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"%@", [[category noteAtIndex:[indexPath row]] title]];

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
		[category removeNoteAtIndex:[indexPath row]];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	[category moveNoteAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
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
    
	//[self.categoryViewController setCategory: [categoryList categoryAtIndex:[indexPath row]]];
	
	if([[category noteAtIndex:[indexPath row]] noteType] == TextNoteType)
	{
		[self.editTextNote setTextNote: (TextNote*) [category noteAtIndex:[indexPath row]]];
		[UIView beginAnimations:@"animation" context:nil];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
		[self.navigationController pushViewController:self.editTextNote animated:NO];
		[UIView commitAnimations];
		
	}else if ([[category noteAtIndex:[indexPath row]] noteType] == PhotoNoteType)
	{
		[self.editPhotoNote setPhotoNote: (PhotoNote*) [category noteAtIndex:[indexPath row]]];
		[UIView beginAnimations:@"animation" context:nil];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
		[self.navigationController pushViewController:self.editPhotoNote animated:NO];
		[UIView commitAnimations];
	}else if ([[category noteAtIndex:[indexPath row]] noteType] == AudioNoteType)
	{
		[self.editAudioNote setAudioNote: (AudioNote*) [category noteAtIndex:[indexPath row]]];
		[UIView beginAnimations:@"animation" context:nil];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO]; 
		[self.navigationController pushViewController:self.editAudioNote animated:NO];
		[UIView commitAnimations];
	}

	
	//[navigationController pushViewController: animated:<#(BOOL)animated#>
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
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

