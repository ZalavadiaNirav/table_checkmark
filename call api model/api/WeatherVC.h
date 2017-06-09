//
//  ViewController.h
//  api
//
//  Created by Nirav Zalavadia on 30/05/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"
#import "AppDelegate.h"

@interface WeatherVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    WeatherModel *objWeather;
    UIAlertController *loader;
    AppDelegate *objapp;
    __weak IBOutlet UITableView *tblVw;
    UIView *loadingVw;
}


@end

