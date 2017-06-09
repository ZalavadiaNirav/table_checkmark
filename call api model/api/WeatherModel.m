//
//  WeatherModel.m
//  api
//
//  Created by Nirav Zalavadia on 30/05/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel


@synthesize date,groundlevel,temp,mintemp,maxtemp,sealevel;


-(instancetype)init :(double)temp1 mintemprature:(double)mintemp1 maxtemprature:(double)maxtemp1 sealevel:(double)sealevel1 groundlevel:(double)groundlevel1 currentDate:(NSString *)date1
{

    if(self=[super init])
    {
        self.temp=temp1;
        self.mintemp=mintemp1;
        self.maxtemp=maxtemp1;
        self.sealevel=sealevel1;
        self.groundlevel=groundlevel1;
        self.date=date1;
    }
    return self;
}






@end
