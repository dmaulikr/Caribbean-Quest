//
//  GLTile.h
//  Pirate Adventure
//
//  Created by Gab on 2014-08-25.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLWeapon.h"
#import "GLArmor.h"

@interface GLTile : NSObject

@property (strong,nonatomic) NSString *story;
@property (strong,nonatomic) NSString *storyAfterVisited;
@property (strong,nonatomic) UIImage *backgroundImage;
@property (strong,nonatomic) NSString *actionButtonName;
@property (strong,nonatomic) NSString *actionButtonDisabledName;
@property (strong,nonatomic) GLWeapon *weapon;
@property (strong,nonatomic) GLArmor *armor;
@property (nonatomic) int healthEffect;
@property (nonatomic) BOOL isVisited;
@property (nonatomic) BOOL isForced;

@end
