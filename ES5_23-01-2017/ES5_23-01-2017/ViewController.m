//
//  ViewController.m
//  Es5
//
//  Created by Gabriele Suerz on 24/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *_nomi;
    NSArray *_cognomi;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initArray {
    _nomi = @[@"Freddie", @"Krista", @"Merle", @"Lorraine", @"Lorenzo", @"Sandra", @"Nichole", @"Floyd", @"Andrea", @"Marcus", @"Jacob", @"Peter", @"Glenn", @"Francis", @"Yvette", @"Evan", @"Shelley", @"Gladys", @"Stella", @"Mindy", @"Beth", @"Everett", @"Audrey", @"Christie", @"Timothy"];
    
    _cognomi = @[@"Campbell", @"Kim", @"Hubbard", @"Weber", @"Greene", @"Brock", @"Hines", @"Clarke", @"Ramsey", @"Reid", @"Garza", @"Herrera", @"Horton", @"Mack", @"Farmer", @"Hughes", @"Lane", @"Carroll", @"Thornton", @"Wilkerson", @"Diaz", @"McKinney", @"Cooper", @"Sutton", @"Walters"];
    
    NSArray *newArray = [self alphaOrder];
}

-(NSMutableArray *) alphaOrder {
    NSMutableArray *arrayTemp;
    NSString *first = _cognomi.firstObject;
    for (int i = 0; i < _cognomi.count; i++) {
        for (int j = i; j < _cognomi.count; j++) {
            if ([_cognomi objectAtIndex:j] < first){
                first = [_cognomi objectAtIndex:j];
                j = 0;
            }
        }
    }
    return arrayTemp;
}

-(void) alphaName {
    
}

@end
