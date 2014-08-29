//
//  GLFactory.m
//  Pirate Adventure
//
//  Created by Gab on 2014-08-25.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import "GLFactory.h"
#import "GLTile.h"

@implementation GLFactory

-(NSArray *)tiles
{
    GLTile *tile00 = [[GLTile alloc]init];
    tile00.story = @"\"Captain, we need a fearless leader to undertake a voyage. There is a  evil pirate who has to be stopped before he steals any more plunder.\" Are you brave enough? If so take this sword and guide us through the vast ocean.";
    tile00.storyAfterVisited = @"You have agreed to lead the voyage by taking to sword. Everyone sees you as a strong leader aready. Don't get killed its a crazy quest.\nDamage: 12";
    tile00.backgroundImage = [UIImage imageNamed:@"WorldMap.jpg"];
    GLWeapon *bluntedSword = [[GLWeapon alloc]init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile00.weapon = bluntedSword;
    tile00.actionButtonName = @"Take the Sword";
    tile00.actionButtonDisabledName = @"Sword Aquired";
    tile00.isVisited = NO;
    tile00.isForced = YES;

    
    GLTile *tile01 = [[GLTile alloc]init];
    tile01.story = @"You have found a steel armor from the captain's cabin. It must have been the old captain's armor. Would you like to upgrade your armor to steel armor?";
    tile01.storyAfterVisited = @"You wear the armor and then you have a vision of the battle of the captian and evil. You witness the brutalness with which the captain was killed\nHealth: +8";
    tile01.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpg"];
    GLArmor *steelArmor = [[GLArmor alloc]init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile01.armor = steelArmor;
    tile01.actionButtonName = @"Take to Steel Armor";
    tile01.actionButtonDisabledName = @"Armor Aquired";
    tile01.isVisited = NO;
    tile01.isForced = NO;

    
    GLTile *tile02 = [[GLTile alloc]init];
    tile02.story = @"A mysterious dock appears on the horizon. \"Should we stop and ask for directions?\" asked one of crewmembers. Would you dare to stop at unknown island?";
    tile02.storyAfterVisited = @"You visited a Winterfell, a village with great hospitality. \nHealth: +12 ";
    tile02.backgroundImage = [UIImage imageNamed:@"Dock.jpg"];
    tile02.healthEffect = 12;
    tile02.actionButtonName = @"Stop at the dock";
    tile02.actionButtonDisabledName = @"Visited Dock";
    tile02.isVisited = NO;
    tile02.isForced = NO;
    
    NSArray *column0 = [[NSArray alloc]initWithObjects:tile00,tile01,tile02, nil];
    
    GLTile *tile10 = [[GLTile alloc]init];
    tile10.story = @"You have found a parrot wounded.\"Evil must die\" the parrot mutttered. \"Parrots are a great defender and are fiercly loyal\" said your crewmen. Would you pet the parrot and take care of it?";
    tile10.storyAfterVisited = @"The parrot and you became very good friends and parrot will risk his life to save yours.\nHealth: +20";
    tile10.backgroundImage = [UIImage imageNamed:@"Parrot.jpg"];
    GLArmor *parrotArmor = [[GLArmor alloc]init];
    parrotArmor.name = @"Perry the Parrot";
    parrotArmor.health = 20;
    tile10.armor = parrotArmor;
    tile10.actionButtonName = @"Adopt Perry";
    tile10.actionButtonDisabledName = @"Perry Aquired";
    tile10.isVisited = NO;
    tile10.isForced = NO;

    GLTile *tile11 = [[GLTile alloc]init];
    tile11.story = @"You have stumbled upon a cache of pirate weapons.You found a Pistol. Would you like to upgrade to a pistol?";
    tile11.storyAfterVisited = @"The pistol is great and after a few shooting practice you are very good at shooting.\nDamage: 15";
    tile11.backgroundImage = [UIImage imageNamed:@"guns.jpg"];
    GLWeapon *pistol = [[GLWeapon alloc]init];
    pistol.name = @"Pistol";
    pistol.damage = 15;
    tile11.weapon = pistol;
    tile11.actionButtonName = @"Take the Pistol";
    tile11.actionButtonDisabledName = @"Pistol Aquired";
    tile11.isVisited = NO;
    tile11.isForced = NO;

    GLTile *tile12 = [[GLTile alloc]init];
    tile12.story = @"You have been captured by pirates and are ordered to walk the plank. You have no choice to go in any direction. You are forced to walk the plank.";
    tile12.storyAfterVisited = @"You jumped in water, but fortunately your ship wasnt far.You are still hurt but you did not die after all. \nHealth: -22";
    tile12.backgroundImage = [UIImage imageNamed:@"Plank.jpg"];
    tile12.healthEffect = -22;
    tile12.actionButtonName = @"Show no fear";
    tile12.actionButtonDisabledName = @"You jumped";
    tile12.isVisited = NO;
    tile12.isForced = YES;
    
    NSArray *column1 = [[NSArray alloc]initWithObjects:tile10,tile11,tile12, nil];

    GLTile *tile20 = [[GLTile alloc]init];
    tile20.story = @"You sight a pirate battle off the coast. \"Should we intervene?\" asked Larry. Do you dare to intervene.";
    tile20.storyAfterVisited = @"You win a small battle and helped some fellow pirates to win a battle against the evil pirate's crew. Although evil wasn't on the ship but this small victory make you confident. \nHealth: +8";
    tile20.backgroundImage = [UIImage imageNamed:@"shipb.jpg"];
    tile20.healthEffect = 8;
    tile20.actionButtonName = @"Fight like a Pirate";
    tile20.actionButtonDisabledName = @"You made friends";
    tile20.isVisited = NO;
    tile20.isForced = NO;
    
    GLTile *tile21 = [[GLTile alloc]init];
    tile21.story = @"The legend of the deep, the mighty kraken appears. The ship is about to get wrecked. Everyone has already jumped off. You are forced to jump off too, to save your life.";
    tile21.storyAfterVisited = @"You managed to escape, the ship fortunated is still in one piece and all your crewmen are alive, but everyone is deeply injured. \nHealth: -46";
    tile21.backgroundImage = [UIImage imageNamed:@"kraken.jpg"];
    tile21.healthEffect = -46;
    tile21.actionButtonName = @"Abandon Ship";
    tile21.actionButtonDisabledName = @"Ship abondoned";
    tile21.isVisited = NO;
    tile21.isForced = YES;
    
    GLTile *tile22 = [[GLTile alloc]init];
    tile22.story = @"You stumble upon a hidden cave of pirate treasurer in the storage of ship. Its your lucky day. Do you want to go to loot this treasure and visit nearby village for restoring health.";
    tile22.storyAfterVisited = @"You visited the village and health is restored.\nHealth:+40";
    tile22.backgroundImage = [UIImage imageNamed:@"Gold.jpg"];
    tile22.healthEffect = 40;
    tile22.actionButtonName = @"Loot the treasure";
    tile22.actionButtonDisabledName = @"Treasure looted";
    tile22.isVisited = NO;
    tile22.isForced = NO;
                        
    NSArray *column2 = [[NSArray alloc]initWithObjects:tile20,tile21,tile22, nil];

    GLTile *tile30 = [[GLTile alloc]init];
    tile30.story = @"A group of evil pirate's crew attempts to board your ship. You need to repel the invaders.";
    tile30.storyAfterVisited = @"You managed to kill them all, but you lost a bit health. \nHealth: -15";
    tile30.backgroundImage = [UIImage imageNamed:@"attack.jpg"];
    tile30.healthEffect = -15;
    tile30.actionButtonName = @"Repel the invaders";
    tile30.actionButtonDisabledName = @"Small victory";
    tile30.isVisited = NO;
    tile30.isForced = YES;
    
    GLTile *tile31 = [[GLTile alloc]init];
    tile31.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile31.storyAfterVisited = @"You dived in and found nothing, but in searching process you hurt yourself. \nHealth: -7";
    tile31.backgroundImage = [UIImage imageNamed:@"deep.jpg"];
    tile31.healthEffect = -7;
    tile31.actionButtonName = @"Swim Deeper";
    tile31.actionButtonDisabledName = @"It's a Trap";
    tile31.isVisited = NO;
    tile31.isForced = NO;
    
    GLTile *tile32 = [[GLTile alloc]init];
    tile32.story = @"Your final faceoff with the fearsome pirate boss";
    tile32.storyAfterVisited = @"You did it, killed the Evil. Your songs will be sung and stories will be told";
    tile32.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpg"];
    tile32.healthEffect = -15;
    tile32.actionButtonName = @"Fight";
    tile32.actionButtonDisabledName = @"Evil Deceased";
    tile32.isVisited = NO;
    tile32.isForced = YES;
    
    NSArray *column3 = [[NSArray alloc]initWithObjects:tile30,tile31,tile32, nil];

    NSArray *tilesArray = [[NSArray alloc]initWithObjects:column0,column1,column2,column3, nil ];

    return tilesArray;
}

-(GLCharacter *)setCharacter
{
    
    GLArmor *cloakarmor = [[GLArmor alloc]init];
    cloakarmor.name = @"Cloak Armor";
    cloakarmor.health = 5;
    
    GLWeapon *fistWeapon = [[GLWeapon alloc] init];
    fistWeapon.name = @"Fists of Fury";
    fistWeapon.damage = 10;
    
    GLCharacter *character = [[GLCharacter alloc]init];
    character.armor = cloakarmor;
    character.weapon = fistWeapon;
    character.health = 100;
    
    return character;
}

-(GLBoss *)setBoss
{
    GLBoss *boss = [[GLBoss alloc]init];
    boss.health = 65;
    return boss;
}

@end
