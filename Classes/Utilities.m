//
//  Utilities.m
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Utilities.h"


@implementation Utilities

+(NSString*) getPasswordHash
{
		return @"Password";
}

+(NSString*) getUUID
{
	CFUUIDRef theUUID = CFUUIDCreate(NULL);
	CFStringRef string = CFUUIDCreateString(NULL, theUUID);
	CFRelease(theUUID);
	return [(NSString *)string autorelease];
}

+(NSString*) getDocumentsDirectory
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

@end
