//
//  HangmanTests.m
//  HangmanTests
//
//  Created by Will Benyon on 22/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import "HangmanTests.h"

#import "GameEngine.h"
#import "WordUpdateRegistrar.h"

@implementation HangmanTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGuessingLetterShouldReportWordState
{
    WordUpdateRegistrar* wordUpdateRegistrar = [[WordUpdateRegistrar alloc] init];

    {

    GameEngine* game = [[GameEngine alloc] initWithWord: @"A" andWordUpdateHandler: wordUpdateRegistrar];
    [game guessLetter: @"B"];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"_", @"");

    }

    {

    GameEngine* game = [[GameEngine alloc] initWithWord: @"AA" andWordUpdateHandler: wordUpdateRegistrar];
    [game guessLetter: @"B"];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"__", @"");

    }
}

@end
