//
//  Note.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"

typedef enum{TextNoteType, PhotoNoteType, AudioNoteType}NoteType;

@interface Note : NSObject {
	NSString *title;
	BOOL locked;
	NoteType noteType;
}

@property (nonatomic, retain) NSString *title;
@property (assign) BOOL locked;
@property (assign) NoteType noteType;

-(void) lock;
-(BOOL) unlock:(NSString*)inputPassword;

@end
