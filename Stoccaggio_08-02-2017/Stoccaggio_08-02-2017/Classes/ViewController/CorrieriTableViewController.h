//
//  CorrieriTableViewController.h
//  Stoccaggio_08-02-2017
//
//  Created by Gabriele Suerz on 13/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CorrieriTableViewDelegate <NSObject>

-(NSArray *)scoreTableViewFetchResults;

-(void)scoreTableViewDidFetchResults;

@end

@interface CorrieriTableViewController : UITableViewController

@property (nonatomic, strong)  NSArray *corrieri;

@property (nonatomic, unsafe_unretained) id <CorrieriTableViewDelegate> delegate;

@end
