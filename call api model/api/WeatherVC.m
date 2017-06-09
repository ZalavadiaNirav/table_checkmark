//
//  ViewController.m
//  api
//
//  Created by Nirav Zalavadia on 30/05/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "WeatherVC.h"
#import "WeatherModel.h"
#import "constants.h"
#import "weatherCell.h"
#import "Session.h"
#import "AppDelegate.h"

@interface WeatherVC ()

@end

@implementation WeatherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    objapp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

- (IBAction)downloadWeatherData:(id)sender
{
    loadingVw=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [loadingVw setBackgroundColor:[UIColor lightGrayColor]];
    [loadingVw setAlpha:0.50];

    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.frame=CGRectMake((self.view.frame.size.width/2),(self.view.frame.size.height/2), 30, 30);

    dispatch_async(dispatch_get_main_queue(), ^{
        [loadingVw addSubview:spinner];
        [self.view addSubview:loadingVw];
        [self.view bringSubviewToFront:loadingVw];
 
    });
    
    [spinner startAnimating];
    
    
    Session *sharedSession=[Session getSharedSession];
    [sharedSession getweatherData:apiID appidStr:appID completion:^(BOOL isComplete)
     {
         NSLog(@"result %d",isComplete);
                 
         dispatch_async(dispatch_get_main_queue(),
        ^{
            [tblVw reloadData];
            [spinner stopAnimating];
            [loadingVw removeFromSuperview];
        });

     }];
    
    
    
}

#pragma mark - tableview

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [objapp.weatherArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    weatherCell *cell=[tableView dequeueReusableCellWithIdentifier:@"weatherCell" forIndexPath:indexPath];
    WeatherModel *obj=[objapp.weatherArr objectAtIndex:indexPath.row];
    cell.tempLbl.text=[NSString stringWithFormat:@"Temprature %f",obj.temp];
    cell.minTempLbl.text=[NSString stringWithFormat:@"Minimum Temprature %f",(obj.mintemp)];
    cell.maxTempLbl.text=[NSString stringWithFormat:@"Maximum Temprature %f",(obj.maxtemp)];
    cell.seaLvlLbl.text=[NSString stringWithFormat:@"Sea Level %f",(obj.sealevel)];
    cell.groundLvlLbl.text=[NSString stringWithFormat:@"Grround Level %f",(obj.groundlevel)];
    cell.dateLbl.text=[NSString stringWithFormat:@"Date Text%@",obj.date];
    return cell;
}



@end
