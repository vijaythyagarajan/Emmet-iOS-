//
//  SportNewsModel.h
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SportNewsModel : NSObject

-(instancetype) initWithData:(NSData *)data;

@property (strong,nonatomic) NSArray *authorName;
@property (strong,nonatomic) NSArray *statusTitle;
@property (strong,nonatomic) NSArray *descrptionText;
@property (strong, nonatomic) NSArray *dateAndTime;
@property (strong,nonatomic) NSArray *DisplayImage;
@property (strong,nonatomic) NSDictionary *articlesDictionary;

@property NSString *responseStatus;
@property NSInteger count;
@end
