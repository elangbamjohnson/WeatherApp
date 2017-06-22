//
//  DownloadWeatherData.m
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import "DownloadWeatherData.h"

@implementation DownloadWeatherData

-(void)getWeatherData:(NSString *)urlStr {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //Call inside background thread
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSURL *url = [NSURL URLWithString:urlStr];
        NSString *json = [NSString stringWithContentsOfURL:url
                                                  encoding:NSASCIIStringEncoding
                                                     error:&error];
        
        //Call inside Main thread
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSData *jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                         options:kNilOptions
                                                                           error:nil];
                [self.delegate updateUI:jsonDict];
            });
        }
    });
}


@end
