//
//  WordUpdateRegistrar.h
//  Hangman
//
//  Created by Will Benyon on 24/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordUpdateHandler.h"

@interface WordUpdateRegistrar : NSObject<WordUpdateHandler>
{
@private
    NSString* word;
}

@property (readonly) NSString* word;

- (void)wordUpdated:(NSString *)word;

@end
