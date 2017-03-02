//
//  Model.m
//  TapChallenge
//
//  Created by Gabriele Suerz on 13/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "Risultato.h"

@implementation Risultato

-(id) initWithScore:(NSInteger)score andDate:(NSDate *)date{
    self = [super init];
    
    if (self) {
        _date = date;
        _score = score;
    }
    
    return self;
}

-(void) encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.score forKey:@"score"];
    [coder encodeObject:self.date forKey:@"date"];
}

-(instancetype) initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _date = [coder decodeObjectForKey:@"date"];
        _score = [coder decodeIntegerForKey:@"score"];
    }
    return self;
}

@end
