//
//  Session.m
//  api
//
//  Created by Nirav Zalavadia on 01/06/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "Session.h"


@implementation Session
@synthesize currentSession;


+(instancetype)getSharedSession
{
    static Session *sharedInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance=[[Session alloc] init];

    });
    return sharedInstance;
}

-(instancetype)init
{
    NSLog(@"session initalize");
    self=[super init];
    self.currentSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    return self;
}

-(void)getweatherData :(NSString *)IDStr appidStr:(NSString *)appidStr completion:(void(^)(BOOL ))completion
{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://samples.openweathermap.org/data/2.5/forecast?id=%@&appid=%@",IDStr,appidStr]];
    NSURLSessionDataTask *task=[currentSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError *error)
    {
        if (error!=nil)
        {
            NSLog(@"Failed to connect to weather data %@",[error description]);
            completion(false);
        }
        else
        {
            NSError *parsingError=nil;
            NSDictionary *tempDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&parsingError];
            if (parsingError!=nil)
            {
                NSLog(@"Weather parsing error %@",[parsingError description]);
                completion(false);
            }
            else
            {
                objApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
                objApp.weatherArr=[[NSMutableArray alloc] init];
                NSLog(@"Weather data received is /n %@",[tempDict description]);
                NSArray *resultArray =[tempDict objectForKey:@"list"];
                if([resultArray count]>0)
                {
                    for (int i=0;i<[resultArray count];i++)
                    {
                        NSDictionary *obj=[[resultArray objectAtIndex:i] objectForKey:@"main"];
                        NSLog(@"list array %@",[obj description]);
                        
                        // set data into model
                        WeatherModel *objModel=[[WeatherModel alloc] init:[obj[@"temp"] doubleValue] mintemprature:[obj[@"temp_min"] doubleValue] maxtemprature:[obj[@"temp_max"] doubleValue] sealevel:[obj[@"sea_level"] doubleValue] groundlevel:[obj[@"grnd_level"] doubleValue] currentDate:[resultArray objectAtIndex:i][@"dt_txt"]];
                        
                        [objApp.weatherArr addObject:objModel];
                    }
                }
                
                completion(true);
            }
        }

    }];

    [task resume];

}


@end
