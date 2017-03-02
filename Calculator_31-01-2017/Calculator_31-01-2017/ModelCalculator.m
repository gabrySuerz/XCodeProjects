//
//  ModelCalculator.m
//  Calculator_31-01-2017
//
//  Created by Gabriele Suerz on 31/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ModelCalculator.h"

@implementation ModelCalculator {
    NSString *_op, *_numb1, *_numb2;
}
/*
-(NSString *) entryPoint: (NSString *) operator:(NSString *) number {
    
}
*/
-(void) numberPressed:(NSString *) number {
    if(_numb1 == nil){
        _numb1 = number;
    } else {
        _numb2 = number;
    }
    
}

-(NSString *) operatorPressed: (NSString *) operator:(NSString *) number{
    double result = 0;
    [self numberPressed:number];
    if (_op == nil) {
     _op = operator;
     return @"";
    } else {
        result = [self operation];
        if ([operator isEqualToString:@"="]) {
            _op = nil;
            _numb1 = nil;
        } else {
            _op = operator;
            _numb1 = [NSString stringWithFormat:@"%g", result];
        }
        _numb2 = nil;
        return [NSString stringWithFormat:@"%g",result];
    }
}

-(double) operation {
    double result = 0, n1 = _numb1.doubleValue, n2 = _numb2.doubleValue;
    if ([_op isEqualToString:@"+"]) {
        result = n1 + n2;
    }
    if ([_op isEqualToString:@"-"]) {
        result = n1 - n2;
    }
    if ([_op isEqualToString:@"*"]) {
        result = n1 * n2;
        
    }
    if ([_op isEqualToString:@"/"]) {
        result = n1 / n2;
    }
    return result;
}

-(void) deleteAll {
    _numb1 = @"";
    _numb2 = @"";
    _op = @"";
}

@end
