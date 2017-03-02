//
//  ViewController.m
//  Es4
//
//  Created by Gabriele Suerz on 23/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray *_arrayRandom;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self generateArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    int somma = [self sommaArray];
    
    [self.lblSomma setText:[NSString stringWithFormat:@"%i", somma]];
    
    NSLog(@"%i", somma);
    NSLog(@"%@", [self descArray]);
    NSLog(@"%@", [self ascArray]);
}

-(void) generateArray {
    _arrayRandom = @[].mutableCopy;
    for(int i = 0; i < 100; i++){
        int n = (int)1 + arc4random() % (100-1+1);
        [_arrayRandom addObject:[NSString stringWithFormat:@"%i",n]];
    }
}

-(int) sommaArray {
    int somma = 0;
    for(int i = 0; i < 100; i++){
        somma += (int)[_arrayRandom objectAtIndex:i];
    }
    return somma;
}

-(NSArray *) descArray {
    return [_arrayRandom sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        NSInteger value1 = obj1.integerValue, value2=obj2.integerValue;
        if (value1 == value2){
            return NSOrderedSame;
        }
        
        if (value1 < value2){
            return NSOrderedDescending;
        }
        
        return NSOrderedAscending;
    }];
}

-(NSArray *) ascArray {
    return [_arrayRandom sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        NSInteger value1 = obj1.integerValue, value2=obj2.integerValue;
        if (value1 == value2){
            return NSOrderedSame;
        }
        
        if (value1 < value2){
            return NSOrderedDescending;
        }
        
        return NSOrderedAscending;
    }];
}

@end
