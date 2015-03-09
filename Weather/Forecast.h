//
//  Forecast.h
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forecast : NSObject

@property (nonatomic, strong)   NSString    *cityName;
@property (nonatomic)           float       currentTemp;
@property (nonatomic)           float       minTemp;
@property (nonatomic)           float       maxTemp;
@property (nonatomic)           float       pressure;
@property (nonatomic)           float       humidity;
@property (nonatomic, strong)   NSString    *weatherDescription;
@property (nonatomic, strong)   NSString    *iconURL;

@end
