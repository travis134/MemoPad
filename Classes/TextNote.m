//
//  TextNote.m
//  MemoPad
//
//  Created by travis sein on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextNote.h"


@implementation TextNote

@synthesize body;

-(id) init
{
		if(self = [super init])
		{
			[self setBody: @"TextNote Body"];
		}
	return self;
}

@end
