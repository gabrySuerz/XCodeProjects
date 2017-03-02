//
//  Corriere.m
//  Stoccaggio_08-02-2017
//
//  Created by Gabriele Suerz on 10/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "Corriere.h"

@implementation Corriere

-(id)initWithVolume:(NSInteger)volume targa:(NSString *)targa {
        // chiamo il costruttore del oggetto da cui eredito (NSObject)
    self = [super init];
        // se costruttore allocato
    if (self) {
        _volume = volume;
        _targa = targa;
    }
        //ritorna self anche nel caso sia null
    return self;
}

@end
