//
//  WeatherParser.h
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecast.h"

@interface ForecastParser : NSObject

+ (Forecast *) todayForecastWithData: (NSData *) data;
+ (NSArray *) nextWeekForecastWithData: (NSData *) data;


@end
