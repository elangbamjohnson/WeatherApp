//
//  ViewController.m
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import "ViewController.h"
#import "UpdateLocationViewController.h"

@interface ViewController (){
    DataManager *dataManager;
}


@property (nonatomic, strong) NSString *weatherUrlStr;
@property (nonatomic, strong) NSDictionary *jsonResponse;

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [DataManager sharedInstance];
    dataManager.urlString = [NSString stringWithFormat:@"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/MI/Detroit.json"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.downloadWeatherData = [[DownloadWeatherData alloc]init];
    
    if (dataManager.urlString) {
        
        [self.downloadWeatherData getWeatherData:dataManager.urlString completionHandler:
         ^(NSDictionary *responseDict, NSError *error) {
             
                 [self updateUI:responseDict];
             
         }];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    UILabel *dayLabel = (UILabel *)[cell.contentView viewWithTag:10];
    UILabel *tempLabel = (UILabel *)[cell.contentView viewWithTag:20];
    UILabel *descLabel = (UILabel *)[cell.contentView viewWithTag:30];
    
    NSArray *descArr = [[self.jsonResponse valueForKey:@"txt_forecast"]objectForKey:@"forecastday"];
    NSArray *dayArr = [[self.jsonResponse valueForKey:@"simpleforecast"]objectForKey:@"forecastday"];
    
    NSString *descStr = [[descArr objectAtIndex:indexPath.row+2]objectForKey:@"fcttext"];
    NSString *dayStr = [[[dayArr objectAtIndex:indexPath.row]objectForKey:@"date"]objectForKey:@"weekday"];
    NSString *lowTemp = [[[dayArr objectAtIndex:indexPath.row]objectForKey:@"low"]objectForKey:@"fahrenheit"];
    NSString *highTemp = [[[dayArr objectAtIndex:indexPath.row]objectForKey:@"high"]objectForKey:@"fahrenheit"];
    
    NSString *lowHighTemp = [NSString stringWithFormat:@"%@º/%@º F",lowTemp,highTemp];
    
    
    

    [dayLabel setText:dayStr];
    [tempLabel setText:lowHighTemp];
    [descLabel setText:descStr];
    
    return cell;
}


#pragma mark - Local Methods

-(void )updateUI:(NSDictionary *)weatherDict {
    
    self.jsonResponse = [weatherDict objectForKey:@"forecast"];
    if (self.jsonResponse != nil) {
        [self setLocationName];
        NSArray *dayArr = [[self.jsonResponse valueForKey:@"simpleforecast"]objectForKey:@"forecastday"];
        NSString *lowTemp = [[[dayArr objectAtIndex:0]objectForKey:@"low"]objectForKey:@"fahrenheit"];
        NSString *highTemp = [[[dayArr objectAtIndex:0]objectForKey:@"high"]objectForKey:@"fahrenheit"];
        NSString *lowHighTemp = [NSString stringWithFormat:@"%@º/%@º F",lowTemp,highTemp];
        [self.tempLabel setText:lowHighTemp];
        [self.weatherTableView reloadData];
        
    }else{
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"No city or State match"
                                  message:@""
                                  delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil, nil];
        
        [alertView show];
    }
   
    
}

-(void )setLocationName {
    
    NSArray *urlArray = [dataManager.urlString componentsSeparatedByString:@"/"];
    NSUInteger arrCount = [urlArray count];
    
    NSString *cityStr = [[[urlArray objectAtIndex:arrCount-1] stringByReplacingOccurrencesOfString:@"%20" withString:@" "] stringByReplacingOccurrencesOfString:@".json" withString:@""];
    NSString *stateStr = [urlArray objectAtIndex:arrCount-2];
    if (cityStr && stateStr) {
        [self.cityLabel setText:cityStr];
        [self.stateLabel setText:stateStr];
    }
    
}

#pragma mark - ButtonAction

- (IBAction)updateLocationAction:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateLocationViewController * locationViewController = (UpdateLocationViewController *)[sb instantiateViewControllerWithIdentifier:@"update-location"];
    locationViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:locationViewController animated:YES completion:nil];
    
    
}
@end
