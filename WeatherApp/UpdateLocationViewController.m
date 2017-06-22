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
    self.stateTextField.delegate = self;
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
    dataManager = [DataManager sharedInstance];    
    dataManager.urlString = [NSString stringWithFormat:@"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/%@/%@.json",stateStr,cityStr];
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= 2;
}


@end
