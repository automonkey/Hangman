//
//  WordUpdateRegistrar.m
//  Hangman
//
//  Created by Will Benyon on 24/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import "WordUpdateRegistrar.h"

@implementation WordUpdateRegistrar

@synthesize word;

- (void)wordUpdated:(NSString *)word_
{
    word = word_;
}

@end
