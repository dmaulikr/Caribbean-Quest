//
//  GLViewController.m
//  Pirate Adventure
//
//  Created by Gab on 2014-08-25.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import "GLViewController.h"
#import "GLFactory.h"
#import "GLTile.h"

@interface GLViewController ()

@end

@implementation GLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    GLFactory *factory = [[GLFactory alloc]init];
    self.tiles = [factory tiles];
    self.character = [factory setCharacter];
    self.boss = [factory setBoss];
    
    self.currentPoint = CGPointMake(0, 0);
    self.isAlerted = NO;
    
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    GLTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }
    else{
        tile.isVisited = YES;
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You fought well but you lost, Retry!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        [self resetTheGame];
    }
    
    else if (self.boss.health <= 0 && self.isAlerted == NO) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory"message:@"You killed the evil pirate boss! \nFeel free to continue the adventure" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        self.isAlerted = YES;
        tile.isVisited = YES;
    }
    [self updateTile];
    [self updateButtons];
}

#pragma mark - IBActions

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    [self resetTheGame];
}

#pragma mark - Helper Methods

-(void)updateTile
{
    GLTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (!tileModel.isVisited) {
        self.storyLabel.text = tileModel.story;
    }
    else {
        self.actionButton.enabled = NO;
        self.storyLabel.text = tileModel.storyAfterVisited;
    }
    
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armourLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    
    if (!tileModel.isVisited) {
        self.actionButton.enabled = YES;
        [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    }
    else {
        self.actionButton.enabled = NO;
        [self.actionButton setTitle:tileModel.actionButtonDisabledName forState:UIControlStateDisabled];
    }
}

-(void)updateButtons
{
    GLTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.isForced) {
        tile.isForced = NO;
        self.westButton.hidden = YES;
        self.northButton.hidden = YES;
        self.eastButton.hidden = YES;
        self.southButton.hidden = YES;
    }
    else{
        self.westButton.hidden = [self shouldButtonBeHidden:CGPointMake(self.currentPoint.x-1, self.currentPoint.y)];
        self.eastButton.hidden = [self shouldButtonBeHidden:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)];
        self.northButton.hidden = [self shouldButtonBeHidden:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)];
        self.southButton.hidden = [self shouldButtonBeHidden:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];
    }
    }

-(BOOL)shouldButtonBeHidden:(CGPoint) point
{
    if(point.x >= 0 && point.y >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    }
    else{
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(GLArmor *) armor withWeapons: (GLWeapon *) weapon withHealthEffect:(int) healthEffect
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage -self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health += healthEffect;
    }
    else {
        self.character.health += self.character.armor.health;
        self.character.damage  += self.character.weapon.damage;
    }
}

-(void)resetTheGame
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

@end
