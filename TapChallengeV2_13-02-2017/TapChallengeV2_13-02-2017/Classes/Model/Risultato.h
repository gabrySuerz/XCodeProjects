//
//  Model.h
//  TapChallenge
//
//  Created by Gabriele Suerz on 13/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Risultato : NSObject <NSCoding>

-(id) initWithScore:(NSInteger)score andDate:(NSDate *)date;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSDate *date;

@end
