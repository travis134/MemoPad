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

+(NSString*) getTimeStamp:(NSString*) stringFormat 
{
	char buffer[80];
	const char *format = [stringFormat UTF8String];
	time_t rawtime;
	struct tm * timeinfo;
	time(&rawtime);
	timeinfo = localtime(&rawtime);
	strftime(buffer, 80, format, timeinfo);
	return [NSString  stringWithCString:buffer encoding:NSUTF8StringEncoding];
}

+(NSString*) getDocumentsDirectory
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

@end
