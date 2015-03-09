//
//  FutureWeatherViewController.m
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "FutureWeatherViewController.h"
#import "WeatherAPIHelper.h"
#import "ForecastParser.h"
#import "ForecastTableViewCell.h"



@interface FutureWeatherViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *forecastWeek;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation FutureWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ForecastTableViewCell class]) bundle: [NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ForecastTableViewCell class])];
    [self initializeTable];
    [self downloadWeekWeather];

    
}

- (void) initializeTable
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* Table view methods begin */


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//self.forecastWeek.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForecastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ForecastTableViewCell class]) forIndexPath:indexPath];
    
    
    return cell;
}


/* Table view methods end */

- (void) downloadWeekWeather
{
    [WeatherAPIHelper nextWeekForecastWithCompletionBlock:^(NSData *resultData){
        _forecastWeek = [ForecastParser nextWeekForecastWithData: resultData];
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
