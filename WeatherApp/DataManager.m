//
//  DataManager.m
//  WeatherApp
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (DataManager*)sharedInstance{
    static DataManager *_sharedInstance;
    if(!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        // Custom initialization
        _urlString = [[NSString alloc] init];
       
    }
    return self;
}


@end
