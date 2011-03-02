//
//  Note.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"

@interface Note : NSObject {
	NSString *title;
	BOOL locked;
}

@property (nonatomic, retain) NSString *title;
@property (assign) BOOL locked;

-(void) lock;
-(BOOL) unlock:(NSString*)inputPassword;

@end
