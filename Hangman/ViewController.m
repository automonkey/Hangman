//
//  ViewController.m
//  Hangman
//
//  Created by Will Benyon on 22/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    gameEngine = [[GameEngine alloc] initWithWord:@"ELEPHANT" andWordUpdateHandler:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)letterPressed:(UIButton*)sender
{
    [gameEngine guessLetter:[[sender titleLabel] text]];
}

- (void)wordUpdated:(NSString *)word
{
    [guessedWord setText:word];
}

@end
