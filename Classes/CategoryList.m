//
//  Category.m
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryList.h"

@implementation CategoryList

@synthesize categories;

-(id) init
{
	if(self = [super init])
	{
		self.categories = [[NSMutableArray alloc] init];
		
	}
	return self;
}

- (void) addNewCategory
{
	[categories addObject:[[Category alloc] init]];
}

-(Category*) categoryAtIndex: (NSUInteger) inputIndex
{
	return (Category*) [categories objectAtIndex:inputIndex]; 
}

-(void) removeCategoryAtIndex: (NSUInteger) inputIndex
{
	[categories removeObjectAtIndex:inputIndex];
}

-(void) moveCategoryAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
	Category *temp = [[categories objectAtIndex:fromIndex] retain];
	[categories removeObjectAtIndex:fromIndex];
	[categories insertObject:temp atIndex:toIndex];
	[temp release];
}

-(NSUInteger) count
{
	return [categories count];
}



@end
