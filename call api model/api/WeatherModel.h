//
//  WeatherModel.h
//  api
//
//  Created by Nirav Zalavadia on 30/05/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject
{

}

@property (nonatomic,retain) NSString *date;
//@property (nonatomic,retain) NSString *icon;

@property (nonatomic,readwrite) double temp;
@property (nonatomic,readwrite) double mintemp;
@property (nonatomic,readwrite) double maxtemp;
@property (nonatomic,readwrite) double sealevel;
@property (nonatomic,readwrite) double groundlevel;
//@property (nonatomic,retain) NSMutableArray<WeatherModel *> *weatherData;


-(instancetype)init :(double)temp mintemprature:(double)mintemp maxtemprature:(double)maxtemp sealevel:(double)sealevel groundlevel:(double)groundlevel currentDate:(NSString *)date;


//+(instancetype)getSharedWeather;
//-(void)init :(NSString *)date icon:(NSString *)icon temp:(double)temp mintemp:(double)mintemp;
//-(void)getweatherData :(NSString *)IDStr appidStr:(NSString *)appidStr completion:(void(^)(BOOL))completion;

@end
