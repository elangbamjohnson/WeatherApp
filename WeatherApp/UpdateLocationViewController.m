//
//  UpdateLocationViewController.m
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import "UpdateLocationViewController.h"
#import "DataManager.h"
#import "ViewController.h"

@interface UpdateLocationViewController (){
    DataManager *dataManager;
}

@property (nonatomic, strong) NSDictionary *jsonResponse;

@end

@implementation UpdateLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)updatedLocationAction:(id)sender {
    
    NSString *cityStr = [self.cityTextField.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *stateStr = self.stateTextField.text;
    dataManager.stateString = stateStr;
    dataManager.cityString = cityStr;
    dataManager = [DataManager sharedInstance];
    dataManager.urlString = [NSString stringWithFormat:@"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/%@/%@.json",stateStr,cityStr];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
   
    
}


@end
