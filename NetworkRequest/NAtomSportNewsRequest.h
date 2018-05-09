//
//  NAtomSportNewsRequest.h
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SportNewsModel.h"
#import "SportCrickDataModel.h"
#import "Helper.h"

@interface NAtomSportNewsRequest : NSObject

+(NAtomSportNewsRequest *) sharedInstance;

@property (strong,nonatomic) SportNewsModel *sportNewsModel;
@property (strong,nonatomic) SportCrickDataModel *sportCrickDataModel;
-(BOOL) getAllSportNews;
-(BOOL) getCricketNews;
@end
