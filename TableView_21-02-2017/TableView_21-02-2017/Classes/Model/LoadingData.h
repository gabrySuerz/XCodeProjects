//
//  LoadingData.h
//  TableView_21-02-2017
//
//  Created by Gabriele Suerz on 28/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataTableViewDelegate <NSObject>

-(void) dataArrived:(NSArray *)aLotOfData;

@end

@interface LoadingData : NSObject

-(void) getData: (NSString *) urlAsString;

@property (nonatomic, unsafe_unretained) id <DataTableViewDelegate> delegate;

@end
