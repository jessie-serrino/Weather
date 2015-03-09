//
//  ViewController.m
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DayWeatherViewController.h"
#import "WeatherAPIHelper.h"
#import "ForecastParser.h"
#import "ImageDownloader.h"

@interface DayWeatherViewController ()

@property (nonatomic, copy) Forecast *forecastToday;
@property (strong, nonatomic) IBOutlet UIImageView *forecastImageView;
@property (strong, nonatomic) IBOutlet UILabel *forecastTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *forecastMaxTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *forecastMinTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *forecastCityLabel;

@property (strong, nonatomic) IBOutlet UILabel *forecastDescriptionLabel;
@end

@implementation DayWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self downloadCurrentWeather];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) downloadCurrentWeather
{
    [WeatherAPIHelper currentDayForecastWithCompletionBlock:^(NSData *resultData){
        
        _forecastToday = [ForecastParser todayForecastWithData: resultData];
        
        self.forecastTempLabel.text = [NSString stringWithFormat:@"%.0f", self.forecastToday.currentTemp ];
        self.forecastMaxTempLabel.text = [NSString stringWithFormat:@"%.0f", self.forecastToday.maxTemp ];
        self.forecastMinTempLabel.text = [NSString stringWithFormat:@"%.0f", self.forecastToday.minTemp ];
        self.forecastDescriptionLabel.text = self.forecastToday.weatherDescription;
        self.forecastCityLabel.text = self.forecastToday.cityName;
        [ImageDownloader imageWithURL: self.forecastToday.iconURL
                      completionBlock:^(UIImage *image){
                          self.forecastImageView.image = image;
         }];

//        NSLog(@"Forecast in %@", self.forecastToday.cityName);
//        NSLog(@"Temp is %f", self.forecastToday.currentTemp);
//        NSLog(@"Max temp is  %f", self.forecastToday.maxTemp);
//        NSLog(@"Min temp is  %f", self.forecastToday.minTemp);
//        NSLog(@"Humidity is %f", self.forecastToday.humidity);
//        NSLog(@"Pressure is %f", self.forecastToday.pressure);
//        NSLog(@"Description is %@", self.forecastToday.weatherDescription);
//        NSLog(@"URL Icon is %@", self.forecastToday.iconURL);        
    }];
}

@end
