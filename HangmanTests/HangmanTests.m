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

- (void)testInitialisingGameReportsWordState
{
    WordUpdateRegistrar* wordUpdateRegistrar = [[WordUpdateRegistrar alloc] init];
    (void)[[GameEngine alloc] initWithWord: @"AAA" andWordUpdateHandler: wordUpdateRegistrar];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"___", @"");
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

- (void)testGuessingCorrectLetterShouldShowGuessedLetterInReportedWordState
{
    WordUpdateRegistrar* wordUpdateRegistrar = [[WordUpdateRegistrar alloc] init];

    {

    GameEngine* game = [[GameEngine alloc] initWithWord: @"AB" andWordUpdateHandler: wordUpdateRegistrar];
    [game guessLetter: @"A"];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"A_", @"");

    }

    {

    GameEngine* game = [[GameEngine alloc] initWithWord: @"BA" andWordUpdateHandler: wordUpdateRegistrar];
    [game guessLetter: @"B"];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"B_", @"");

    }
}

- (void)testGuessingCorrectLetterShouldShowAllInstancesOfGuessedLetterInReportedWordState
{
    WordUpdateRegistrar* wordUpdateRegistrar = [[WordUpdateRegistrar alloc] init];

    GameEngine* game = [[GameEngine alloc] initWithWord: @"BAB" andWordUpdateHandler: wordUpdateRegistrar];
    [game guessLetter: @"B"];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"B_B", @"");
}

- (void)testGuessingMultipleCorrectLettersShouldShowAllInReportedWordState
{
    WordUpdateRegistrar* wordUpdateRegistrar = [[WordUpdateRegistrar alloc] init];

    GameEngine* game = [[GameEngine alloc] initWithWord: @"ABC" andWordUpdateHandler: wordUpdateRegistrar];
    [game guessLetter: @"A"];
    [game guessLetter: @"B"];

    STAssertEqualObjects(wordUpdateRegistrar.word, @"AB_", @"");
}

@end
