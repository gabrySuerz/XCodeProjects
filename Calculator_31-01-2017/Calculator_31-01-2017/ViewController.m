//
//  ViewController.m
//  Calculator_31-01-2017
//
//  Created by Gabriele Suerz on 31/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"
#import "ModelCalculator.h"

@interface ViewController () {
    
    ModelCalculator *_model;
    NSString *_numb;

}

@property (weak, nonatomic) IBOutlet UILabel *_displayLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _model = [[ModelCalculator alloc] init];
    _numb = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSString *originalString = sender.currentTitle;
    NSCharacterSet *numberSet = [NSCharacterSet decimalDigitCharacterSet];
    NSString *trimmedString = [originalString stringByTrimmingCharactersInSet:numberSet];

    
    if ((trimmedString.length == 0) && (originalString.length > 0)) {
        _numb = [_numb stringByAppendingString:originalString];
        [self._displayLabel setText:_numb];
    } else {
        if ([sender.currentTitle isEqualToString:@"."]) {
            _numb = [_numb stringByAppendingString:sender.currentTitle];
            [self._displayLabel setText:_numb];
        } if ([sender.currentTitle isEqualToString:@"CE"]) {
            [_model deleteAll];
            _numb = @"";
        } if ([sender.currentTitle isEqualToString:@"C"]) {
            _numb = @"";
        } if ([sender.currentTitle isEqualToString:@"DEL"]) {
            _numb = [_numb substringToIndex:[_numb length]-1];
            [self._displayLabel setText:_numb];
        } if ([sender.currentTitle isEqualToString:@"+/-"]) {
            if(![[_numb substringToIndex:1] isEqualToString:@"-"]){
                _numb = [@"-" stringByAppendingString:_numb];
            } else {
                _numb = [_numb substringFromIndex:1];
            }
            [self._displayLabel setText:_numb];
        } else {
            NSString *res = [_model operatorPressed:sender.currentTitle:_numb];
            NSLog(@"%@ %@",sender.currentTitle, res);
            _numb = @"";
            if (![res  isEqual: @""]){
                [self._displayLabel setText:res];
            } else {
                [self._displayLabel setText:sender.currentTitle];
            }
        }
    }
}

@end
