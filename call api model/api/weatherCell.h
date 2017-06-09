//
//  weatherCell.h
//  api
//
//  Created by Nirav Zalavadia on 31/05/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weatherCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tempLbl;
@property (weak, nonatomic) IBOutlet UILabel *minTempLbl;
@property (weak, nonatomic) IBOutlet UILabel *maxTempLbl;
@property (weak, nonatomic) IBOutlet UILabel *seaLvlLbl;
@property (weak, nonatomic) IBOutlet UILabel *groundLvlLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@end
