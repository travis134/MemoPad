//
//  Category.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utilities.h"
#import "Note.h"
#import "TextNote.h"
#import "PhotoNote.h"
#import "AudioNote.h"

@interface Category : NSObject {
	NSString *title;
	NSMutableArray *notes;
	BOOL locked;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSMutableArray *notes;
@property (assign) BOOL locked;

-(void) addNewTextNote;
-(void) addNewPhotoNote;
-(void) addNewAudioNote;
-(Note*) noteAtIndex: (NSUInteger) inputIndex;
-(void) removeNoteAtIndex: (NSUInteger) inputIndex; 
-(void) moveNoteAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
-(NSUInteger) count;
-(void) lock;
-(BOOL) unlock:(NSString*)inputPassword;

@end
