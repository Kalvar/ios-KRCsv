//
//  KRCsv.h
//  KRCSVSample
//
//  Created by Kalvar on 13/10/14.
//  Copyright (c) 2013年 Kalvar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KRCsv : NSObject
{
    NSString *fileName;
}

@property (nonatomic, strong) NSString *fileName;

+(KRCsv *)sharedManager;
-(NSString *)dataFilePath;
-(void)saveArray:(NSArray *)_strings completion:(void(^)(NSString *filePath))_completion;
-(void)saveString:(NSString *)_csvString completion:(void(^)(NSString *filePath))_completion;

@end
