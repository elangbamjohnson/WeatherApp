//
//  UpdateLocationViewController.h
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadWeatherData.h"

@interface UpdateLocationViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) DownloadWeatherData *downloadWeatherData;

- (IBAction)updatedLocationAction:(id)sender;

@end
