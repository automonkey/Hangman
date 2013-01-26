//
//  ViewController.h
//  Hangman
//
//  Created by Will Benyon on 22/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameEngine.h"
#import "WordUpdateHandler.h"

@interface ViewController : UIViewController <WordUpdateHandler>
{
@private
    GameEngine* gameEngine;
    IBOutlet UILabel *guessedWord;
}

- (IBAction)letterPressed:(UIButton*)sender;

@end
