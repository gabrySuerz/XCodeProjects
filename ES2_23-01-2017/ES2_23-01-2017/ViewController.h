//
//  ViewController.h
//  Es2
//
//  Created by Gabriele Suerz on 23/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

#pragma mark - properties

@property (nonatomic, weak) IBOutlet UILabel *lblNumber;
@property (nonatomic, weak) IBOutlet UITextField *txtNumber;

#pragma mark - userTextField

-(IBAction)txtNumberDidEndOnExit:(id)sender;

@end

