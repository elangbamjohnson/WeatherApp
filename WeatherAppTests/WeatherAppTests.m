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

- (void)testAsynchronousRequest
{

           
    XCTestExpectation *expectation = [self expectationWithDescription:@"asynchronous request"];
    
    NSURL *url = [NSURL URLWithString:@"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/MI/Detroit.json"];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        XCTAssertNil(error, @"dataTaskWithURL error %@", error);
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        
        XCTAssert(data, @"data nil");
        
                
        [expectation fulfill];
    }];
    [task resume];
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}


@end
