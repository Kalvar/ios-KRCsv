//
//  KRCsv.m
//  KRCSVSample
//
//  Created by Kalvar on 13/10/14.
//  Copyright (c) 2013年 Kalvar. All rights reserved.
//

#import "KRCsv.h"

@implementation KRCsv

@synthesize fileName = _fileName;

+(KRCsv *)sharedManager
{
    static dispatch_once_t pred;
    static KRCsv *_object = nil;
    dispatch_once(&pred, ^{
        _object = [[KRCsv alloc] init];
    });
    return _object;
}

-(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if( !_fileName )
    {
        _fileName = @"sample";
    }
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.csv", _fileName]];
}

-(void)saveArray:(NSArray *)_strings completion:(void(^)(NSString *filePath))_completion
{
    NSString *_string = [_strings componentsJoinedByString:@", \n"];
    [self saveString:_string completion:_completion];
}

-(void)saveString:(NSString *)_csvString completion:(void(^)(NSString *filePath))_completion
{
    NSString *_filePath = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:_filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:_filePath contents:nil attributes:nil];
    }  
    NSFileHandle *handle;
    handle = [NSFileHandle fileHandleForWritingAtPath:_filePath ];
    [handle truncateFileAtOffset:[handle seekToEndOfFile]];
    [handle writeData:[_csvString dataUsingEncoding:NSUTF8StringEncoding]];
    if( _completion )
    {
        _completion(_filePath);
    }
}

@end
