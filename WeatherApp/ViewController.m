//
//  ViewController.m
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *weatherUrlStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.weatherUrlStr = [NSString stringWithFormat:@"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/CA/San_Francisco.json"];
    self.downloadWeatherData = [[DownloadWeatherData alloc]init];
    [self.downloadWeatherData setDelegate:self];
    [self.downloadWeatherData getWeatherData:self.weatherUrlStr];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DownloadWeatherDataDelegate

-(void )downloadDidFinished:(NSDictionary *)weatherDict {
    
    NSLog(@"%@",weatherDict);
    
    
}
@end
