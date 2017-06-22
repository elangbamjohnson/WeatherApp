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
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"HTTP request"];
    [self.
     downloadJson:[NSURL URLWithString:@"a json file"]];
    
    [self waitForExpectationsWithTimeout:5
                                 handler:^(NSError *error) {
                                     // handler is called on _either_ success or
                                     // failure
                                     if (error != nil) {
                                         XCTFail(@"timeout error: %@", error);
                                     } else {
                                         XCTAssertNotNil(
                                                         self.vc.response,
                                                         @"downloadJson failed to get data");
                                     }
                                 }];
    
    
}

@end
