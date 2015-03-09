//
//  WeatherParser.m
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "ForecastParser.h"

@implementation ForecastParser

+ (Forecast *) todayForecastWithData: (NSData *) data
{
    NSError *error;
    NSDictionary *forecastJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if(error)
    {
        return nil;
    }
    
    return [self forecastFromProperties:forecastJson];
}

+ (Forecast *) forecastFromProperties:(NSDictionary *) properties
{
    Forecast * forecast = [[Forecast alloc] init];
    
    NSArray *data = [properties objectForKey:@"list"];
    forecast.cityName = [[data valueForKey:@"name"] firstObject];
    
    NSDictionary *main = [[data valueForKey:@"main"] firstObject];
    [ForecastParser parseMainAttributes:main inForecast:forecast];

    NSDictionary *descriptors = [[data valueForKey:@"weather"] firstObject][0];
    [ForecastParser parseDescriptorAttributes:descriptors inForecast:forecast];
    
    return forecast;
}

+ (void) parseMainAttributes: (NSDictionary *) attributes inForecast: (Forecast *) forecast
{
    forecast.humidity = [attributes[@"humidity"] floatValue];
    forecast.pressure = [attributes[@"pressure"] floatValue];
    forecast.currentTemp = [attributes[@"temp"] floatValue];
    forecast.maxTemp = [attributes[@"temp_max"] floatValue];
    forecast.minTemp = [attributes[@"temp_min"] floatValue];
}

+ (void) parseDescriptorAttributes: (NSDictionary *) attributes inForecast: (Forecast *) forecast
{
    forecast.weatherDescription = attributes[@"description"];
    NSString *suffix = attributes[@"icon"];
    forecast.iconURL = [ForecastParser iconURLWithSuffix: suffix];
}

+ (NSString *) iconURLWithSuffix: (NSString *) suffix
{
    return [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", suffix];
}



+ (NSArray *) nextWeekForecastWithData: (NSData *) data
{
    NSError *error;
    
//    NSDictionary *forecastJson = [ForecastParser fakeJson];
    NSDictionary *forecastJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", forecastJson);
    if(error)
    {
        return nil;
    }
    
    NSArray *forecasts = forecastJson[@"list"];
    
    NSMutableArray *week = [[NSMutableArray alloc] init];
    for(NSDictionary *forecast in forecasts)
    {
        Forecast * fore = [ForecastParser forecastFromListProperties:forecast];
        fore.cityName = forecastJson[@"city"][@"name"];
        [week addObject:fore];
    }
    
    
    return week;
}

+ (Forecast *) forecastFromListProperties: (NSDictionary *) properties
{
    Forecast *forecast = [[Forecast alloc] init];
    
    forecast.humidity = [properties[@"humidity"] floatValue];
    forecast.pressure = [properties[@"pressure"] floatValue];
    forecast.currentTemp = [properties[@"temp"][@"day"] floatValue];
    forecast.maxTemp = [properties[@"temp"][@"max"] floatValue];
    forecast.minTemp = [properties[@"temp"][@"min"] floatValue];
    forecast.weatherDescription = properties[@"weather"][0][@"description"];
    NSString *suffix = properties[@"weather"][0][@"icon"];
    forecast.iconURL = [ForecastParser iconURLWithSuffix:suffix];

    return forecast;
}



@end
