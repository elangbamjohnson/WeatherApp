//
//  DownloadWeatherData.h
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloadWeatherDataDelegate;

@interface DownloadWeatherData : NSObject

{
    id <DownloadWeatherDataDelegate> delegate;
}

@property (weak) id delegate;

-(void)getWeatherData:(NSString *)urlStr;


@end

@protocol DownloadWeatherDataDelegate <NSObject>

@required

-(void )updateUI:(NSDictionary *)weatherDict;


@end
