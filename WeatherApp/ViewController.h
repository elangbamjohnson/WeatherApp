//
//  ViewController.h
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadWeatherData.h"
#import "DataManager.h"



@interface ViewController : UIViewController <DownloadWeatherDataDelegate,UITableViewDelegate,UITableViewDataSource>
- (IBAction)updateLocationAction:(id)sender;

@property (strong, nonatomic) DownloadWeatherData *downloadWeatherData;
@property (strong, nonatomic)IBOutlet UITableView *weatherTableView;

@property (weak, nonatomic) IBOutlet UITableViewCell *WeatherTableViewCell;


@end

