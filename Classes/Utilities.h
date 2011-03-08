//
//  Utilities.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Utilities : NSObject {
	
}

+(NSString*) getPasswordHash;
+(NSString*) getUUID;
+(NSString*) getDocumentsDirectory;

@end
