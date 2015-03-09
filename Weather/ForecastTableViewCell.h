//
//  ForecastTableViewCell.h
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *highTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentTempLabel;
@property (strong, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (strong, nonatomic) IBOutlet UILabel *weatherDescription;


@end
