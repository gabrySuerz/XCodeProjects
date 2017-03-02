//
//  myTableViewController.m
//  TableView_21-02-2017
//
//  Created by Gabriele Suerz on 21/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "myTableViewController.h"
#import "LoadingData.h"

@interface myTableViewController () {
    
    NSArray *datiTabella;
    UIActivityIndicatorView *spinner;
    
}

@end

@implementation myTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (spinner == nil){
        spinner = [[UIActivityIndicatorView alloc] initWithFrame:self.view.frame];
        spinner.color = [UIColor blackColor];
        spinner.hidesWhenStopped = YES;
        [self.view addSubview:spinner];
    }
    
    [spinner startAnimating];
    
    LoadingData *ld = [[LoadingData alloc] init];
    [ld getData:[NSString stringWithFormat:@"https://jsonplaceholder.typicode.com/albums"]];
    ld.delegate = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return datiTabella.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *obj = (NSDictionary *) datiTabella[indexPath.row];
    cell.textLabel.text = [obj objectForKey:@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%@", [obj valueForKey:@"id"]];
    
    return cell;
}


#pragma mark - ScoreTableViewDelegate

-(void) dataArrived:(NSArray *)aLotOfData {
    datiTabella = (NSArray *) aLotOfData;
    [self.tableView reloadData];
    [spinner stopAnimating];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
