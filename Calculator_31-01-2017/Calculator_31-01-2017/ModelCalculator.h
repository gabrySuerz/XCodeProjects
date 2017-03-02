//
//  ModelCalculator.h
//  Calculator_31-01-2017
//
//  Created by Gabriele Suerz on 31/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCalculator : NSObject {
    
}

    //-(NSString *) entryPoint: (NSString *) op:(NSString *) number;
-(void) numberPressed:(NSString *) number;
-(NSString *) operatorPressed: (NSString*) op: (NSString *) number;
-(double) operation;
-(void) deleteAll;

@end
