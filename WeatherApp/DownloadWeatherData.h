//
//  DownloadWeatherData.h
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DownloadWeatherData : NSObject

-(void)getWeatherData:(NSString *)urlStr completionHandler:(void (^)(NSDictionary *responseObject, NSError *error))completionHandler;

@end
