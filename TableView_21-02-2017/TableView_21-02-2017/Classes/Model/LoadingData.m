//
//  LoadingData.m
//  TableView_21-02-2017
//
//  Created by Gabriele Suerz on 28/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "LoadingData.h"
#import "myTableViewController.h"

@implementation LoadingData

-(void) getData: (NSString *) urlAsString{
        //NSString *urlAsString = [NSString stringWithFormat:@"https://jsonplaceholder.typicode.com/albums"];
    
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedUrlAsString = [urlAsString stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:encodedUrlAsString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                if (!error) {
                        // Success
                    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                        NSError *jsonError;
                        NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                        
                        if (jsonError) {
                            
                        } else {
                            [self.delegate dataArrived:jsonResponse];
                        }
                    }  else {
                            //Web server is returning an error
                    }
                } else {
                        // Fail
                    NSLog(@"error : %@", error.description);
                }
            }] resume];
}

@end
