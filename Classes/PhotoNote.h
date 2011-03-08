//
//  TextNote.h
//  MemoPad
//
//  Created by travis sein on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"


@interface PhotoNote : Note {
	UIImage *body;
}

@property (nonatomic, retain) UIImage *body;

@end
