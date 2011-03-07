//
//  Category.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"

@interface CategoryList : NSObject {
	NSMutableArray *categories;
}

@property (nonatomic, retain) NSMutableArray *categories;


-(void) addNewCategory;
-(Category*) categoryAtIndex: (NSUInteger) inputIndex;
-(void) removeCategoryAtIndex: (NSUInteger) inputIndex; 
-(void) moveCategoryAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
-(NSUInteger) count;

@end
