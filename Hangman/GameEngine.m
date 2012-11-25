//
//  GameEngine.m
//  Hangman
//
//  Created by Will Benyon on 22/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

- (id)initWithWord:(NSString *)word_ andWordUpdateHandler: (WordUpdateHandler *)wordUpdateHandler_
{
    if(self = [super init])
    {
        self->word = word_;
        self->wordUpdateHandler = wordUpdateHandler_;
        self->guessedWord = [@"" stringByPaddingToLength:[word_ length] withString:@"_" startingAtIndex:0];
    }

    return self;
}

- (id)init
{
    return nil;
}

- (void)guessLetter:(NSString *)letter_
{
    if([word rangeOfString:letter_].location == NSNotFound)
    {
        guessedWord = [@"" stringByPaddingToLength:[word length] withString:@"_" startingAtIndex:0];
    }
    else
    {
        guessedWord = [letter_ stringByPaddingToLength:[word length] withString:@"_" startingAtIndex:0];
    }

    [wordUpdateHandler wordUpdated:guessedWord];
}

@end
