//
//  GLFactory.h
//  Pirate Adventure
//
//  Created by Gab on 2014-08-25.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLCharacter.h"
#import "GLBoss.h"

@interface GLFactory : NSObject

-(NSArray *)tiles;
-(GLCharacter *)setCharacter;
-(GLBoss *)setBoss;

@end
