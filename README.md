## Supports

Easy making a CSV file, and it will save in Document of App.

## How To Get Started

``` objective-c
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
```

## Version

V0.2 Beta.

## License

KRCsv is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
