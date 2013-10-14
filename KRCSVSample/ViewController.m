//
//  ViewController.m
//  KRCSVSample
//
//  Created by Kalvar on 13/10/14.
//  Copyright (c) 2013年 Kalvar. All rights reserved.
//

#import "ViewController.h"
#import "KRCsv.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    KRCsv *_krCsv   = [KRCsv sharedManager];
    _krCsv.fileName = @"2013_10_14_sample";
    NSMutableArray *_csvs = [[NSMutableArray alloc] initWithCapacity:0];
    NSString *_csvTitle   = @"Name, Phone, Address";
    [_csvs addObject:_csvTitle];
    for( int i=1; i<100; ++i )
    {
        NSString *_csvString = [NSString stringWithFormat:@"%i, %i, %i", i, i+1, i+2];
        [_csvs addObject:_csvString];
    }
    [_krCsv saveArray:_csvs completion:^(NSString *filePath) {
        NSLog(@"saved filePath : %@", filePath);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
