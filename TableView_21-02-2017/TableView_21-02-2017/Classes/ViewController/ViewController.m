//
//  ViewController.m
//  TableView_21-02-2017
//
//  Created by Gabriele Suerz on 21/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate> {
    NSArray *datiTabella, *datiSecondaTabella;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITableView *mySecondTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    datiTabella = @[@"Prima", @"Seconda", @"Terza", @"Quarta"];
    datiSecondaTabella = @[@"Cane", @"Gatto", @"Pappagallo", @"Cocorito", @"Cavallo"];
    
    self.mySecondTableView.rowHeight = UITableViewAutomaticDimension;
    self.mySecondTableView.estimatedRowHeight = 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void) dataArrived:(NSData *)aLotOfData {
    datiTabella = (NSArray *) aLotOfData;
    [self.myTableView reloadData];
}*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual: self.myTableView]) {
        return datiTabella.count;
    } else if ([tableView isEqual: self.mySecondTableView]){
        return datiSecondaTabella.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    if ([tableView isEqual: self.myTableView]) {
        cell.textLabel.text = [datiTabella objectAtIndex:[indexPath row]];
    } else if ([tableView isEqual: self.mySecondTableView]){
        cell.textLabel.text = [datiSecondaTabella objectAtIndex:[indexPath row]];
    }
    
    
    return cell;
}

@end
