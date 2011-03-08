//
//  TextNote.m
//  MemoPad
//
//  Created by travis sein on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoNote.h"


@implementation PhotoNote

@synthesize body;

-(id) init
{
	if(self = [super init])
	{
		[self setNoteType:PhotoNoteType];
	}
	return self;
}

@end
