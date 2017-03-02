//
//  ViewController.h
//  TapChallenge
//
//  Created by Gabriele Suerz on 13/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreTableViewController.h"

@interface GameViewController : UIViewController <ScoreTableViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *tapsCountLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

-(IBAction)buttonPressed:(id)sender;

-(IBAction)tapGestureRacognizerDidRecognize:(id)sender;

@end

