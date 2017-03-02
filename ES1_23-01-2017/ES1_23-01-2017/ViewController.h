//
//  ViewController.h
//  Name
//
//  Created by Gabriele Suerz on 23/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic, weak) IBOutlet UILabel *lblName;
@property (nonatomic, weak) IBOutlet UITextField *txtName;

-(IBAction)txtNameEditingChange:(id)sender;
-(IBAction)txtNameEditingDidEnd:(id)sender;
-(IBAction)txtNameDidEndOnExit:(id)sender;

@end

