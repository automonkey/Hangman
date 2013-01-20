//
//  GameEngine.m
//  Hangman
//
//  Created by Will Benyon on 22/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

- (id)initWithWord:(NSString *)word_ andWordUpdateHandler: (id <WordUpdateHandler>)wordUpdateHandler_
{
    if(self = [super init])
    {
        self->word = word_;
        self->wordUpdateHandler = wordUpdateHandler_;
        self->guessedWord = [@"" stringByPaddingToLength:[word_ length] withString:@"_" startingAtIndex:0];

        [wordUpdateHandler wordUpdated:guessedWord];
    }

    return self;
}

- (id)init
{
    return nil;
}

- (void)guessLetter:(NSString *)letter
{
    NSUInteger wordLength = [guessedWord length];

    NSRange range = NSMakeRange(0, wordLength);
    while(range.location != NSNotFound)
    {
        range = [word rangeOfString:letter options:0 range:range];
        if(range.location != NSNotFound)
        {
            guessedWord = [guessedWord stringByReplacingCharactersInRange:range withString:letter];
            range = NSMakeRange(range.location + range.length, wordLength - (range.location + range.length));
        }
    }

    [wordUpdateHandler wordUpdated:guessedWord];
}

@end
