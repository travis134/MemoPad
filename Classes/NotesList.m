//
//  NotesList.m
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NotesList.h"

@implementation NotesList

@synthesize title, notes, locked;

-(id) init
{
		if(self = [super init])
		{
			[self setTitle: @"Category Title"];
			self.notes = [[NSMutableArray alloc] init];
			[self setLocked:NO];
		}
	return self;
}

- (void) addNewTextNote
{
	[notes addObject:[[TextNote alloc] init]];
}

-(Note*) noteAtIndex: (NSUInteger) inputIndex
{
	return (Note*) [notes objectAtIndex:inputIndex]; 
}

-(void) removeNoteAtIndex: (NSUInteger) inputIndex
{
	[notes removeObjectAtIndex:inputIndex];
}

-(void) moveNoteAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
	Note *temp = [[notes objectAtIndex:fromIndex] retain];
	[notes removeObjectAtIndex:fromIndex];
	[notes insertObject:temp atIndex:toIndex];
	[temp release];
}

-(NSUInteger) count
{
	return [notes count];
}

-(void) lock
{
	[self setLocked:YES];
}
	 
-(BOOL) unlock:(NSString*)inputPassword
{
	if(inputPassword == [Utilities getPasswordHash])
	{
		[self setLocked:NO];
	}
	return [self locked];
}

@end
