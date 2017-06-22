//
//  DownloadWeatherData.m
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import "DownloadWeatherData.h"

@implementation DownloadWeatherData

-(void)getWeatherData:(NSString *)urlStr completionHandler:(void (^)(NSDictionary *responseObject, NSError *error))completionHandler {
    NSURL *weatherUrl = [NSURL URLWithString:urlStr];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:weatherUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            NSError *JSONError = nil;
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONError];
            if (dictionary) {
                
                if (completionHandler) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completionHandler(dictionary, nil);
                    });
                }
            } else {
               
                if (completionHandler) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completionHandler(nil, JSONError);
                    });
                }
            }
        } else {
            if (completionHandler) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionHandler(nil, error);
                });
            }
           
        }
    }];
    
    [task resume];
        
        
}

@end
