//
//  WordUpdateHandler.h
//  Hangman
//
//  Created by Will Benyon on 25/11/2012.
//  Copyright (c) 2012 Benyonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WordUpdateHandler <NSObject>
@required
- (void)wordUpdated:(NSString *)word;

@end
