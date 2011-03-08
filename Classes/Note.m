//
//  Note.m
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize title, locked, noteType;

-(id) init
{
		if(self = [super init])
		{
			[self setTitle: @"Note Title"];
			[self setLocked:NO];
		}
	return self;
}

-(void) lock;
{
	[self setLocked:YES];
}

-(BOOL) unlock:(NSString*)inputPassword;
{
	if(inputPassword == [Utilities getPasswordHash])
	{
		[self setLocked:NO];
	}
	return [self locked];
}

@end
