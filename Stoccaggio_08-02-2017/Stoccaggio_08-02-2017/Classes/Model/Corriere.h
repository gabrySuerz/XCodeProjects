//
//  Corriere.h
//  Stoccaggio_08-02-2017
//
//  Created by Gabriele Suerz on 10/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Corriere : NSObject

-(id)initWithVolume:(NSInteger)volume targa:(NSString *)targa;

    ///  Volume del corriere
@property (nonatomic, readonly) NSString *targa;

    ///  Volume del corriere
@property (nonatomic, readonly) NSInteger volume;

    ///  Peso del corriere
@property (nonatomic) NSInteger peso;

    ///  Array pacchi
@property (nonatomic) NSMutableArray *pacchi;

@end
