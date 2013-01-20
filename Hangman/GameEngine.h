//
//  GameEngine.h
//  Hangman
//
//  Created by Will Benyon on 22/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WordUpdateHandler.h"

@interface GameEngine : NSObject
{
@public
    NSString* word;
    NSString* guessedWord;

    id <WordUpdateHandler> wordUpdateHandler;
}

- (id)initWithWord:(NSString *)word andWordUpdateHandler: (id <WordUpdateHandler>)wordUpdateHandler;
- (id)init;

- (void)guessLetter:(NSString *)letter;

@end
