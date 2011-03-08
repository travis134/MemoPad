//
//  TextNote.h
//  MemoPad
//
//  Created by travis sein on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "Utilities.h"


@interface AudioNote : Note {
	NSURL *body;
}

@property (nonatomic, retain) NSURL *body;

@end
