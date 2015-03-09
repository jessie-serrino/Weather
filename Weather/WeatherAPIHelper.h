//
//  WeatherAPIHelper.h
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherAPIHelper : NSObject

+ (void) currentDayForecastWithCompletionBlock: (void (^)(NSData *resultData)) completionBlock;

+ (void) nextWeekForecastWithCompletionBlock: (void (^)(NSData *resultData)) completionBlock;

@end
