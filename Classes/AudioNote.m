//
//  TextNote.m
//  MemoPad
//
//  Created by travis sein on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AudioNote.h"


@implementation AudioNote

@synthesize body;

-(id) init
{
	if(self = [super init])
	{
		[self setNoteType:AudioNoteType];
		[self setBody: [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.caf", [Utilities getDocumentsDirectory], [Utilities getTimeStamp:@"%Y-%m-%d_%H-%M-%S"]]]];
	}
	return self;
}

@end
