//
//  WeatherAPIHelper.m
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "WeatherAPIHelper.h"

@implementation WeatherAPIHelper

+ (void) currentDayForecastWithCompletionBlock: (void (^)(NSData *resultData)) completionBlock
{
    NSString *weatherURL = @"http://api.openweathermap.org/data/2.5/find?q=Madrid,es&units=imperial";
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:weatherURL]
           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
               completionBlock(data);
           }] resume];
}

+ (void) nextWeekForecastWithCompletionBlock: (void (^)(NSData *resultData)) completionBlock
{
//@"http://hardworking-mink-2867.vagrantshare.com/person/"; //
    NSString *weatherURL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=Madrid,es&mode=json&units=imperial&cnt=7";
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:weatherURL]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                completionBlock(data);
            }] resume];
}

@end
