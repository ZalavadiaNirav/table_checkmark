//
//  Session.h
//  api
//
//  Created by Nirav Zalavadia on 01/06/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "WeatherModel.h"

@interface Session : NSURLSession
{
    AppDelegate *objApp;
}

@property (nonatomic,retain) NSURLSession *currentSession;

+(instancetype)getSharedSession;
-(void)getweatherData :(NSString *)IDStr appidStr:(NSString *)appidStr completion:(void(^)(BOOL))completion;


@end
