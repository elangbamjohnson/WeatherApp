//
//  WeatherAppTests.m
//  WeatherAppTests
//
//  Created by Elangbam, Johnson (J.) on 6/21/17.
//  Copyright © 2017 Elangbam, Johnson (J.). All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DownloadWeatherData.h"

@interface WeatherAppTests : XCTestCase

@end

@implementation WeatherAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDownloadWeatherData
{
//    DownloadWeatherData *weatherData;
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Get Weather data"];
//    
//    [weatherData getWeatherData:@"a json url"];
    
    
//        [[Conector sharedInstance] performAsynchronousRequestWithServerRequest:_srvRequest completionHandler:^(RequestAsynchronousStatus finishStatus, NSData *data) {
//            if (finishStatus == RequestAsynchronousOK)
//            {
//                _data = data;
//                [self notify:XCTAsyncTestCaseStatusSucceeded];
//                NSLog(@"Data OK");
//            }
//        }];
//        
//        [self waitForTimeout:10];
//        
//        XCTAssertNotNil(_data, @"Data was nil");
//    
//    
//    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    
    //////////////////////////////////////////////////////////
//    [self prepare];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSURL *url = [NSURL URLWithString:@"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/CA/San_Francisco.json"];
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
               // [self.delegate updateUI:jsonDict];
            });
        }
    });

    
}

@end
