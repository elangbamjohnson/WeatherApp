//
//  ViewController.h
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadWeatherData.h"



@interface ViewController : UIViewController <DownloadWeatherDataDelegate>

@property (strong, nonatomic) DownloadWeatherData *downloadWeatherData;


@end

