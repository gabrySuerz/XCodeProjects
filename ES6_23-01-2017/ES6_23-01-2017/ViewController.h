//
//  ViewController.h
//  Es6
//
//  Created by Gabriele Suerz on 24/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *txtName;
@property (nonatomic, weak) IBOutlet UITextField *txtSurname;
@property (nonatomic, weak) IBOutlet UITextField *txtAge;

-(IBAction)buttonPressed:(id)sender;

@end
