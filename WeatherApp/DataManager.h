//
//  DataManager.h
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
+ (DataManager*)sharedInstance;

// Your dictionary
@property (nonatomic,strong) NSString* urlString;
@property (nonatomic,strong) NSString* stateString;
@property (nonatomic,strong) NSString* cityString;



@end
