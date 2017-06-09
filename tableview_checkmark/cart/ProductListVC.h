//
//  ViewController.h
//  cart
//
//  Created by Nirav Zalavadia on 06/06/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Productcell.h"

@interface ProductListVC : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableArray *selectedItem,*selectedInedxArr;
    NSMutableArray *productArray;
}

@property (weak, nonatomic) IBOutlet UITableView *productList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewCartBtn;


- (IBAction)ViewCartAction:(id)sender;



-(void)addToCartPressed:(UIButton *)sender;


@end

