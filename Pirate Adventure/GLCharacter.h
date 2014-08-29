//
//  GLCharacter.h
//  Pirate Adventure
//
//  Created by Gab on 2014-08-25.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLArmor.h"
#import "GLWeapon.h"

@interface GLCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic,strong) GLWeapon *weapon;
@property (nonatomic,strong) GLArmor *armor;

@end
